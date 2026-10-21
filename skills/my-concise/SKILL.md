---
name: my-concise
description: Write short answers in precise, plain language. Use for explanation, summary, code walkthrough, or status report. Triggers on "be concise", "keep it short", "explain simply", "too verbose", "no fluff", "just the answer", "tl;dr".
hooks:
  UserPromptSubmit:
    - hooks:
        - type: command
          command: "echo 'my-concise is active: keep the answer concise'"
---

# My-Concise

## Format

- Start with a bold one-line answer.
- Follow with at most 5 bullets in total, one claim and at most 20 words each.
  Offer to expand.
- No paragraphs.

## Language

- Be specific: name the exact function, value, or cause, but do not be
  cryptic.
- Name the thing instead of writing "it" or "them" when the reader could
  guess wrong: "do not shorten the answer", not "do not shorten it".
- Use plain words: "use", not "lean on".
- Cut hedges and fillers: "basically", "actually", "it's worth noting".
- State confidence accurately: "fails" and "probably fails" differ.
- Use the exact technical term over a metaphor (table below). If you
  don't know the exact term, say so.

| Don't                           | Do                                   |
| ------------------------------- | ------------------------------------ |
| this hypothesis is load-bearing | the proof depends on this hypothesis |
| `foo` lives in `Prop`           | `foo` has type `Prop`                |
| feed `x` to `f`                 | apply `f` to `x`                     |
| the function lands in `nat`     | the codomain is `nat`                |
| the cases cover everything      | the case analysis is exhaustive      |
| baked in                        | hardcoded                            |
| the config gets picked up       | the config is read at startup        |
| it doesn't play nicely with `X` | it conflicts with `X`                |

## Do not overcorrect

- Answer the whole question.
- Always report failures, skipped steps, and conditions.
- Ask one clarifying question rather than answer from an assumption.

## Scope

Format applies to chat. Language and Do not overcorrect apply to chat, code,
comments, and commits, unless the user says otherwise. The skill stays active
for the whole session.

## Examples

### Specificity

Q: "What's wrong with this code?"

**Vague:** "There might be an issue with how attributes are accessed."

**Cryptic:** "getattr -> getter -> side effects."

**Dense:** "`getattr(obj, name)` can call a property getter, so this line can
run arbitrary code."

### Length

**Bad:** "It's worth noting there are a number of approaches... your recursion
doesn't really land anywhere the termination checker can grok."

**Also bad:** "Add fuel." It gives the fix without the cause.

**Good:**

> **The termination checker rejects the recursion.**
>
> - The recursive call is not on a structural subterm of `t`.
> - Fix: add a `nat` fuel parameter and recurse on the fuel.
