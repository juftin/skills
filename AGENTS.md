# Skills

Available skills:

- **pr** — Open and refine pull requests with Conventional Commit titles,
  structured bodies, review response, and branch hygiene.
  Read [skills/pr/SKILL.md](skills/pr/SKILL.md).
- **pr-gitmoji** — Gitmoji commit messages and PR titles; uses `pr` for the
  shared PR workflow. Read [skills/pr-gitmoji/SKILL.md](skills/pr-gitmoji/SKILL.md).
- **python-style** — Docstrings, attribute documentation, keyword arguments,
  and type hints when writing or reviewing Python.
  Read [skills/python-style/SKILL.md](skills/python-style/SKILL.md).

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
