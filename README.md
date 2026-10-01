# Skills

Shared [Agent Skills](https://agentskills.io/specification) for **Claude Code**, **OpenAI Codex**, **Gemini CLI**, and other agents that support the standard. Each skill lives in `skills/`; native plugins and local discovery links use the same files.

## Skills

| Skill  | Description                                                                                                                      |
| ------ | -------------------------------------------------------------------------------------------------------------------------------- |
| **pr** | Open and refine pull requests — conventional commit or gitmoji titles, structured PR bodies, review response, and branch hygiene |

## Installation

### Multiple agents

The [skills CLI](https://github.com/vercel-labs/skills) installs to Claude Code, Codex, Gemini CLI, Cursor, GitHub Copilot, OpenCode, Windsurf, and other supported agents. Requires Node.js with `npx`.

Run from the project where you want the skill installed:

```bash
npx skills add juftin/skills --skill pr
```

Select your agents when prompted. Add `--global` to make the skill available across projects, or `--copy` if your system does not support symlinks. To target the three main agents explicitly:

```bash
npx skills add juftin/skills --skill pr --agent claude-code codex gemini-cli
```

### Prerequisites

The `pr` skill requires `git`, the [GitHub CLI](https://cli.github.com/) (`gh`), shell execution, and network access for GitHub operations. Authenticate `gh` before using the skill. Tool permissions are managed by the host agent.

### Claude Code

Install the [Claude Code marketplace](https://code.claude.com/docs/en/plugin-marketplaces) from your shell:

```bash
claude plugin marketplace add https://github.com/juftin/skills
claude plugin install juftin@juftin
```

Invoke the installed skill with `/juftin:pr`. To try a local checkout without installing the marketplace:

```bash
claude --plugin-dir /absolute/path/to/skills
```

### OpenAI Codex

Install the [Codex plugin marketplace](https://developers.openai.com/plugins/build/plugins) from your shell:

```bash
codex plugin marketplace add https://github.com/juftin/skills
codex plugin add juftin@juftin
```

Start a new session after installing. For direct skill installation, use the skills CLI above or copy `skills/pr/` to `~/.agents/skills/pr/`. Codex [discovers local skills](https://developers.openai.com/codex/skills) in `.agents/skills/` and supports symlinked skill folders. Ask Codex to use the `pr` skill, or select it with `$pr`.

### Gemini CLI

Install the [Gemini extension](https://geminicli.com/docs/extensions/reference/) containing the shared skills:

```bash
gemini extensions install https://github.com/juftin/skills
```

Restart Gemini after installing, then confirm discovery with `/skills list`. For skill-only installation, use the skills CLI above or `gemini skills link /absolute/path/to/skills/skills/pr`. Gemini also [discovers skills](https://geminicli.com/docs/cli/using-agent-skills/) in `.agents/skills/` and `.gemini/skills/`.

### Other agents and manual installation

Use the skills CLI to select your agent, or copy the entire `skills/pr/` directory into its documented skills location as `pr/`. Keep `SKILL.md` and any supporting files together. Agents without native skill discovery can be directed to read `skills/pr/SKILL.md` explicitly if they support file access and shell execution.

### Working in this repository

A normal Git checkout includes `.agents/skills -> ../skills` for Codex, Gemini, and other agents using that path, plus `.claude/skills -> ../skills` for Claude Code. These links expose all skills without maintaining separate copies. `CLAUDE.md` and `GEMINI.md` link to `AGENTS.md` for shared repository instructions.

If Git checks out symlinks as text files on your system, use the skills CLI with `--copy` in another project or manually copy the skill directories into your agent's skills location.

## Adding Skills

Each skill is a directory under `skills/` containing a `SKILL.md` file with YAML frontmatter:

```yaml
---
name: my-skill
description: "When to use this skill — write this for the model, not for humans."
---
```

Use portable instructions and document actual dependencies in the skill body. Include the required `name` and `description` fields; use standard optional fields such as `license`, `compatibility`, `metadata`, and `allowed-tools` when useful. Tool names and preapproval behavior depend on the host; respect its permissions. Avoid agent-specific hooks or variables in shared skills.

The plugins, Gemini extension, and local discovery links automatically expose new directories under `skills/`. Update the skill catalog in this README and `AGENTS.md` when adding a skill; manifests only need changes when plugin metadata or packaging changes.

Before submitting changes, run the configured checks and native Claude validation:

```bash
pre-commit run --all-files
claude plugin validate .claude-plugin/plugin.json
claude plugin validate .claude-plugin/marketplace.json
```

## Structure

```
├── .agents/
│   ├── plugins/
│   │   └── marketplace.json # Codex marketplace manifest
│   └── skills -> ../skills  # Codex / Gemini / shared local discovery
├── .claude/
│   └── skills -> ../skills  # Claude Code local discovery
├── .claude-plugin/
│   ├── marketplace.json     # Claude Code marketplace manifest
│   └── plugin.json          # Claude Code plugin manifest
├── .codex-plugin/
│   └── plugin.json          # Codex plugin manifest
├── gemini-extension.json    # Gemini CLI extension manifest
├── AGENTS.md                # Shared repository instructions
├── CLAUDE.md -> AGENTS.md    # Claude Code repository instructions
├── GEMINI.md -> AGENTS.md    # Gemini CLI repository instructions
└── skills/
    └── pr/
        └── SKILL.md         # The pr skill
```
