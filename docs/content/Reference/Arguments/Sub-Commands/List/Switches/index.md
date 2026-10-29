---
status: index
comments: true
icon: lucide/flag
description: Switches accepted by the List sub-command.
---

# Switches
Switches accepted by the [List](../index.md){data-preview} sub-command to filter the listed identifiers.

| Switch | Long | Short | Value | Summary |
| ------ | ---- | ----- | ----- | ------- |
| [Base](Base.md){data-preview} | `base` | `b` | Optional, variable | Keep abbreviations that accept all specified base commands. |
| [Match](Match.md){data-preview} | `match` | `m` | `fixed` or `regex` | Filter by the match type of the initial arguments. |
| [Value RegExp](Value-RegExp.md){data-preview} | `regex` | `r` | None (toggle) | Interpret the supplied positionals as regular expressions. |
| [Invert](Invert.md){data-preview} | `invert` | `i` | None (toggle) | Invert the filters applied by the other arguments. |
