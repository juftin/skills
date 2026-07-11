---
name: worktree
description: >-
  Use when starting any non-trivial coding task — feature work, bugfixes,
  refactors, or anything that touches multiple files. Creates an isolated git
  worktree so changes don't pollute the main working tree. Invoke proactively
  before writing code, even if the user doesn't explicitly ask for a worktree.
  Working in a worktree keeps the main branch clean and allows parallel work on
  multiple tasks without stashing or committing half-done changes.
---

# Worktree

Isolate every task in its own git worktree. This keeps the main checkout
pristine, avoids cross-task contamination, and makes it trivial to switch
contexts — no stashing, no WIP commits, no "which branch was I on?"

## When

Before writing any code. If the user asks for a feature, a bugfix, a refactor,
or any change that touches files, create a worktree first, then do the work
inside it.

Skip only for:
- Pure research / read-only exploration
- Single-line typos or trivial one-liners
- The current directory is already inside a worktree

## Setup

### 1. Already in one?

Check whether the working directory is already inside a worktree:

```bash
pwd | grep -q '.worktrees/\|.claude/worktrees/' && echo "yes" || echo "no"
```

If "yes", skip creation. You're already isolated.

### 2. Pick a name

Derive a short kebab-case name from the task at hand:

| Task                            | Name                      |
| ------------------------------- | ------------------------- |
| "Add login via OAuth"           | `login-oauth`             |
| "Fix checkout race condition"   | `fix-checkout-race`       |
| "Refactor auth middleware"      | `refactor-auth-middleware`|
| "Bump dependencies"             | `bump-deps`               |

### 3. Create it

```bash
git fetch origin main
git worktree add ".worktrees/<name>" -b "<name>" --track origin/main
```

This creates `.worktrees/<name>` at the repo root, branches off
`origin/main`, and checks out a new branch named `<name>`.

If the branch already exists (resuming prior work), that command will fail.
Enter the existing worktree directly instead (step 4).

### 4. Enter it

Use the `EnterWorktree` tool with `path` set to the worktree directory. The
path is `$(git rev-parse --show-toplevel)/.worktrees/<name>`.

## Cleanup

When the task is complete and changes are merged (or abandoned):

- Use `ExitWorktree` with `action: "remove"` and `discard_changes: true` if
  you want to delete the worktree and its branch.

## How agents should use this

The point of this skill is that every agent invocation for implementation work
starts by entering a worktree. This means:
- The main checkout stays on `main`, clean, and never has uncommitted changes.
- Multiple agents can work on different tasks simultaneously without
  interfering with each other.
- Abandoned or experimental work can be thrown away cleanly.
