---
name: spec-driven-development
description: "Plan non-trivial work with Spec Kit before implementing it. Use when starting a non-trivial feature, bug fix, refactor, or migration, when defining behavior, scope, or acceptance criteria, or when committing or linking spec artifacts (spec.md, plan.md, tasks.md) in PRs."
---

# Spec-Driven Development

Prefer [Spec Kit](https://github.com/juftin/spec-kit)
for non-trivial features, bug fixes, refactors, and migrations. Define the intended
behavior, scope, and acceptance criteria before implementation. Scale the process
to the work; a small, obvious edit can use a brief plan.

Use the installed `speckit` and `speckit-*` skills in your agent. Global skills
work across projects without running `specify init` in each repository.

If Spec Kit is not installed, install the `specify` CLI and the global skills:

```bash
uv tool install specify-cli --from git+https://github.com/juftin/spec-kit.git
npx skills add juftin/spec-kit -g
```

Read the project's existing constitution and conventions first. Use
`/speckit-constitution` to establish principles once per project if needed.

**Quickstart path** — use when requirements and technical constraints are clear:

```text
/speckit-specify <requirements>
/speckit-plan <technical constraints>
/speckit-tasks
/speckit-implement
/speckit-converge
```

**Full path** — adds clarification, a requirements-quality checklist, and
cross-artifact consistency analysis before implementation:

```text
/speckit-specify <requirements>
/speckit-clarify
/speckit-plan <technical constraints>
/speckit-checklist
/speckit-tasks
/speckit-analyze
/speckit-implement
/speckit-converge
```

Run commands one at a time and review each artifact before proceeding. Repeat
`/speckit-implement` and `/speckit-converge` until convergence reports `Converged`;
validate the result with the project's checks and tests. New feature artifacts default to
`docs/specs/<feature>/` (`spec.md`, `plan.md`, and `tasks.md`); projects with an
existing root `specs/` directory continue to use it.

Follow the project's convention for spec retention. Some projects commit and keep
specs; others omit them from the final tree. In projects that do not retain specs,
it is still valuable to commit the spec artifacts and delete them in a follow-up
commit. This keeps the final tree consistent with project conventions while
preserving the design and acceptance criteria in Git history.

Reference these artifacts in PRs with permalinks to the full commit SHA that
contains them, for example:
`https://github.com/<owner>/<repo>/blob/<full-commit-sha>/docs/specs/<feature>/spec.md`.
Link relevant plans and task lists too. Commit-specific links let reviewers read
the artifacts after their deletion; keep the referenced commit available when
rewriting history.
