---
name: pr-gitmoji
description: "Apply Gitmoji conventions to commit messages and PR titles when requested by the user or project. Use for writing Gitmoji commits, opening or updating Gitmoji PRs, and handling review feedback on them. Uses the pr skill for the shared PR workflow."
---

# Gitmoji Commits and Pull Requests

Use emoji prefixes for commit messages and PR titles. Explicit user and project
instructions take precedence. No `GITMOJI` environment variable is required.

For PR work, load the companion `pr` skill and follow its workflow, body template,
review guidance, and checks. Use this skill's Gitmoji convention in place of its
default Conventional Commit titles. Install both skills together; when working
from this repository, the companion is [../pr/SKILL.md](../pr/SKILL.md).

For commit-only work, use the conventions below and the project's required
checks. Loading this skill does not authorize pushing a branch or creating a PR.

## Title and Commit Convention

```
<emoji> [scope?][:?] <summary>

[optional body]

[optional footer(s)]
```

Choose the emoji that best describes the change's primary intent:

| Prefix | Intent                         |
| ------ | ------------------------------ |
| ✨     | New feature                    |
| 🐛     | Bug fix                        |
| 💥     | Breaking change                |
| ♻️     | Refactor                       |
| 📝     | Documentation                  |
| ⚡️     | Performance                    |
| 🧪     | Tests                          |
| 🔧     | Configuration                  |
| ⬆️     | Dependency bump                |
| 🎉     | Initial commit / project start |
| 🔖     | Version bump                   |
| 📈     | Analytics                      |
| ♿️     | Accessibility                  |
| 🌐     | Internationalization           |

Examples:

- `🎉 package-name`
- `✨ Add login via OAuth`
- `🐛 Fix onClick event handler`
- `♻️ (components): Transform classes to hooks`
- `♿️ (account): Improve modals a11y`

When a ticketing system is in use, put the ticket number in the scope:
`✨ (ENG-123): Add login via OAuth`.

Use the body to explain why a change matters when the subject is insufficient:

```
⚡️ Lazyload home screen images

Optimize performance by loading images only when they are
about to enter the viewport.
```

For breaking changes, include a `BREAKING CHANGE:` footer:

```
💥 Remove support for legacy auth

BREAKING CHANGE: Legacy username/password auth is no longer
supported. Users must migrate to OAuth before upgrading.
```

Don't add yourself as a co-author unless the user asks or project documentation
requires it.
