# Skills

Skills for LLM coding agents. Each subdirectory is one skill: a `SKILL.md`
holding YAML frontmatter (`name`, `description`) followed by the instructions.

## Linking a skill

Claude Code does not read this directory. It loads skills from two paths:

- `~/.claude/skills/<name>/SKILL.md` — available in every project
- `<project>/.claude/skills/<name>/SKILL.md` — available in that project only

Symlink a skill into one of them:

```sh
mkdir -p ~/.claude/skills
ln -s ~/notes/skills/my-concise ~/.claude/skills/my-concise
```

A symlink keeps this repository as the single source.

Invoke the skill as `/my-concise`. Claude also loads it on its own when a
request matches the `description` in the frontmatter.
