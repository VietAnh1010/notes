---
name: my-handoff
description: Write a handoff note so a fresh session can continue the task or conversation without this session's context.
argument-hint: "[goal for the next session]"
disable-model-invocation: true
---

# My-Handoff

Write a note that a fresh session can start from, for coding work or a
conversation of questions. Include only the context that the next goal needs.

## Steps

1. Take the next goal from the argument. If there is none, use the next step
   of the current task or the open thread of the conversation.
2. In a git repo, run `git status` and `git log --oneline -5`. Also run any
   check whose result the note states, such as tests.
3. Write the note in the format below to this path:
   `~/.local/state/claude-handoffs/<project>-<time>.md`
   For `~/notes/skills` on 2026-10-21 17:16: `skills-20261021-1716.md`.
4. Reply with a command that starts the next session from the note. Example:
   `claude "Read ~/.local/state/claude-handoffs/skills-20261021-1716.md and follow it."`

## Note format

Start with a title. In a git repo, add the check line, with `<repo>`
replaced by the absolute path of the git root:

```markdown
# Handoff: <goal>

Before you start, run `git -C <repo> status` and `git -C <repo> log --oneline -5`,
compare them with Known, and report any difference to the user.
```

Then add these sections as `##` headings, in this order. Leave out a section
that would be empty.

| Section            | Content                                                  |
| ------------------ | -------------------------------------------------------- |
| Goal               | The next goal, in the user's words.                      |
| User background    | The user's expertise and preferred style of explanation. |
| Known              | Facts, each ending in `(source: ...)` or `(unverified)`. |
| Questions answered | `<question>: <one-line conclusion>` per question.        |
| Decisions          | `<choice> because <reason>. Rejected: <option>.`         |
| User instructions  | Lasting instructions from the user, quoted.              |
| Next               | Numbered steps, in order.                                |
| Open questions     | Anything waiting on the user.                            |
| Files              | `<path>`: why the file matters.                          |

## Rules

- Keep the note under 40 lines. Leave out what git or the code already
  records.
- Include what memory records. Memory loads only in its own project, and the
  next session may start elsewhere.
- A source is a command, commit, file, or URL you checked in this session, or
  "user said". Mark any other fact `(unverified)`.
- Record only lasting instructions. A request about one answer, such as
  "answer briefly" for one question, is not a lasting instruction.
- Name files, functions, commits, and concepts explicitly. The next session
  has none of this session's context.
- Never write secrets, tokens, or passwords into the note.
