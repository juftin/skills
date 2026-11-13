---
name: taskfiles
description: "Run development workflows through go-task (`task`). Use whenever installing dependencies, formatting, linting, type checking, testing, building, or running commands in a project with a Taskfile.yaml, or when reading or editing a Taskfile."
---

# Task Runners

Most projects are orchestrated by [go-task](https://github.com/go-task/task). The root `Taskfile.yaml`
defines the underlying tasks that power development and CI workflows. This ensures consistency across
environments and provides a single source of truth for how to perform common operations. When in doubt,
check the Taskfile to see how something is done.

**LLM reference**: <https://taskfile.dev/llms.txt> — fetch this when you need authoritative,
current `task` / Taskfile syntax details.

**Whenever possible, invoke development workflows through `task` rather than calling the underlying tools
(`uv`, `pytest`, `ruff`, `mypy`, `docker`, etc.) directly.** The Taskfile sets the correct flags, env vars,
and ordering - bypassing it produces results that don't match CI.

Task names vary between projects, so discover them before running anything. Run
`task --list-all` and pick tasks by the role their description states, not by name
alone. The same name can mean different things: in one project `task check` runs
formatting, linting, and type checking; in another it runs type checking only, with
formatting and linting under `task lint`. When a description is unclear, read the
task's definition in the Taskfile or run `task --summary <name>`.

Common roles to look for:

| Role                | Typical names                          |
| ------------------- | -------------------------------------- |
| Install deps        | `install`                              |
| Auto-fix            | `fix`                                  |
| Format + lint       | `lint`, `check:style`                  |
| Type check          | `check:types`, `check`                 |
| All code checks     | `check` (when it includes all of them) |
| Test                | `test`                                 |
| Build artifacts     | `build`                                |
| Regenerate lockfile | `lock`                                 |
| Run a command       | `run -- <args>`                        |

When verifying a change, make sure the tasks you run together cover formatting,
linting, type checking, and tests.

Pass extra args through with `{{.CLI_ARGS}}`, e.g. `task test -- tests/test_foo.py::test_bar`.
