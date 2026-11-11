---
name: python-style
description: "Apply Python style conventions when writing, modifying, or reviewing Python code, including tests and fixtures. Covers docstrings, attribute documentation, keyword arguments, and type hints; defer to project-specific conventions."
---

# Python Style

Apply these conventions to code you write or modify. Follow the project's
constitution and style when they differ. Keep changes scoped to the task;
these rules do not call for a documentation or typing sweep of unrelated code.

## Docstrings

Document every module, class, function, method, and notable attribute, including
private helpers, test functions, and pytest fixtures.

- Use NumPy style (`Parameters`, `Returns`, `Raises`, `Notes`) by default;
  match the project's existing style when it differs.
- Explain what the code does and why a caller would reach for it, rather than
  restating the signature. Use one-liners for trivial helpers and full sections
  when parameters, returns, or exceptions need explanation.
- Document attributes, dataclass fields, TypedDict keys, and module constants
  with a bare triple-quoted string immediately after the assignment or field
  declaration.
- Put rationale and invariants in docstrings so introspection, IDEs, and
  generated documentation can expose them. Reserve `#` comments for non-obvious
  local mechanics such as bug workarounds or subtle invariants.

## Keyword Arguments

Prefer keyword arguments beyond the obvious first argument or two. This applies
to your code and library calls, and keeps call sites clear when signatures change:

```python
df.to_parquet(path, index=False)
subprocess.run(cmd, check=True, capture_output=True)
```

## Type Hints

Annotate parameters and return types on every function and method, including
tests and fixtures. Annotate local variables when their type is non-obvious.
Use modern syntax (`list[str]`, `dict[str, int]`, `X | None`) on Python 3.10+.

```python
def test_empty_result() -> None:
    """An empty input produces no records."""
    assert transform([]) == []
```
