---
name: python-style
description: "Python project and code style conventions. Use whenever writing, editing, or reviewing Python code, or managing Python dependencies and environments. Covers uv for dependency management, NumPy-style docstrings, keyword arguments, and type hints."
---

# Python Style

## Python Projects

Python project dependency and environment management is handled by
[`uv`](https://docs.astral.sh/uv/) — **not** `pip`, `pip-tools`, `poetry`, or `conda`.

- **Running commands**: Use `uv run <cmd>` to execute anything inside the project environment.
  `uv run` automatically resolves and activates the project virtualenv — there is no
  need to `source .venv/bin/activate` first.
- **Adding dependencies**: Use `uv add <package>` (or `uv add --dev <package>` for dev-only
  deps). This updates `pyproject.toml` and `uv.lock` in one step. Do **not** hand-edit
  `pyproject.toml` to add deps.
- **Removing dependencies**: Use `uv remove <package>`.
- **Syncing**: `uv sync` installs everything from the lockfile. `task install` wraps this.
- **Lockfile**: `uv.lock` is committed. Regenerate via `task lock` when needed.

Prefer the project's `task` wrappers (`task install`, `task lock`, etc.); reach for `uv`
directly only when no Taskfile entrypoint exists.

**LLM reference**: <https://docs.astral.sh/uv/llms.txt> — fetch this when you need authoritative,
current `uv` usage details.

## Python Style

- **Docstrings**: Every module, class, function, method, and notable attribute
  gets a docstring — including private helpers, test functions, and pytest
  fixtures.
  - **Style**: NumPy (Parameters / Returns / Raises / Notes) by default;
    match the project's existing style if it differs.
  - **AttributeDocStrings**: a bare triple-quoted string on the line
    immediately after a class- or module-level assignment documents
    attributes, dataclass fields, TypedDict keys, and module constants in
    place.
  - **Content**: explain _what and why a caller would reach for it_ — don't
    just restate the signature. One-liners for trivial helpers; full
    sections when params/returns/raises are worth documenting.
  - **Docstrings vs `#` comments**: put rationale and invariants in the
    docstring — docstrings are introspectable (`help()`, IDE tooltips,
    generated docs). Reserve `#` comments for non-obvious local mechanics
    (bug workarounds, subtle invariants).
- **Keyword Arguments**: Prefer keyword arguments over positional for anything beyond
  the obvious first argument or two. Keyword call sites are self-documenting, survive
  parameter reorderings, and make diffs easier to review. Applies to your own code and
  to library calls (e.g. `df.to_parquet(path, index=False)`,
  `subprocess.run(cmd, check=True, capture_output=True)`).
- **Type Hints**: Annotate every function and method — parameters and return types —
  including unit tests (`def test_foo() -> None:`) and pytest fixtures. Annotate local
  variables when the type is non-obvious. Use modern syntax (`list[str]`,
  `dict[str, int]`, `X | None`) on Python 3.10+.
