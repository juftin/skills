# Skills

A cross-platform agent skills directory and Claude Code marketplace — compatible with **Claude Code**, **OpenAI Codex CLI**, **Gemini CLI**, and any tool that follows the [agentskills.io](https://agentskills.io) open standard.

## Skills

| Skill  | Description                                                                                               |
| ------ | --------------------------------------------------------------------------------------------------------- |
| **pr** | Open and refine pull requests — gitmoji titles, structured PR bodies, review response, and branch hygiene |

## Installation

### Claude Code

```bash
claude plugin marketplace add https://github.com/juftin/skills
claude plugin install juftin@juftin
```

Or install directly:

```bash
claude plugin install https://github.com/juftin/skills
```

### OpenAI Codex

```bash
codex plugin marketplace add https://github.com/juftin/skills
codex plugin install juftin@juftin
```

### Gemini CLI

```bash
gemini extensions install https://github.com/juftin/skills
```

### Cursor

From the agent chat:

```
/add-plugin https://github.com/juftin/skills
```

## Adding Skills

Each skill is a directory under `skills/` containing a `SKILL.md` file with YAML frontmatter:

```yaml
---
name: my-skill
description: "When to use this skill — write this for the model, not for humans."
allowed-tools: "Bash, Read, Grep, Glob"
---
```

Update the plugin manifests and root configs to list the new skill.

## Structure

```
├── .claude-plugin/
│   ├── marketplace.json     # Claude Code marketplace manifest
│   └── plugin.json          # Claude Code plugin manifest
├── .codex-plugin/
│   └── plugin.json          # Codex plugin manifest
├── gemini-extension.json    # Gemini CLI extension manifest
├── CLAUDE.md                # Claude Code root config
├── AGENTS.md                # Codex / Cursor / Copilot / Windsurf root config
├── GEMINI.md                # Gemini CLI root config
└── skills/
    └── pr/
        └── SKILL.md         # The pr skill
```
