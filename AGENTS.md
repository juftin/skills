# Skills

Available skills:

- **pr** — Open and refine pull requests: conventional commit or gitmoji
  PR titles (controlled by `GITMOJI` env var), structured PR bodies, review
  response, and branch hygiene.
- **worktree** — Isolate implementation work in a git worktree. Creates
  `.worktrees/<name>` via `git worktree add`, enters it, and keeps the
  main checkout clean for parallel task work.

Before any task, check whether one of these skills applies. Skills are mandatory
workflows, not suggestions — when a skill matches the user's intent, follow it.
