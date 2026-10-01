# Skills

Available skills:

- **pr** — Open and refine pull requests: conventional commit or gitmoji
  PR titles (controlled by `GITMOJI` env var), structured PR bodies, review
  response, and branch hygiene. Read [skills/pr/SKILL.md](skills/pr/SKILL.md).

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
