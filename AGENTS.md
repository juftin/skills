# Skills

Available skills:

- **pr-conventional** — Open and refine pull requests with conventional commit
  PR titles, structured PR bodies, review response, and branch hygiene. Read
  [skills/pr-conventional/SKILL.md](skills/pr-conventional/SKILL.md).
- **pr-gitmoji** — Open and refine pull requests with gitmoji PR titles,
  structured PR bodies, review response, and branch hygiene. Read
  [skills/pr-gitmoji/SKILL.md](skills/pr-gitmoji/SKILL.md).
- **python-style** — Python conventions: `uv` dependency and environment
  management, NumPy docstrings, keyword arguments, and type hints. Read
  [skills/python-style/SKILL.md](skills/python-style/SKILL.md).
- **spec-driven-development** — Plan non-trivial work with Spec Kit before
  implementing it. Read
  [skills/spec-driven-development/SKILL.md](skills/spec-driven-development/SKILL.md).
- **taskfiles** — Run development workflows through go-task (`task`). Read
  [skills/taskfiles/SKILL.md](skills/taskfiles/SKILL.md).

Before any task, check whether one of these skills applies. Skills are mandatory
workflows, not suggestions — when a skill matches the user's intent, follow it.

Edit skills in `skills/`, the shared source for every agent. `.agents/skills` and
`.claude/skills` link to that directory for local discovery. `CLAUDE.md` and
`GEMINI.md` link to this file so repository instructions stay consistent.

Keep shared skills in the Agent Skills format with the required `name` and
`description` frontmatter. Use standard optional fields such as `license`,
`compatibility`, `metadata`, and `allowed-tools` when useful. Describe environment
requirements in the skill body; use the host's available tools and respect its
permissions.
