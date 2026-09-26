---
comments: true
icon: lucide/fullscreen
description: Dynamically expand using a command's output as the *Expansion* string
---

# Expander
Dynamically expand using a command's output as the [*Expansion*][expansion]{data-preview} string

## Properties
|   Value  | Short |    Long    | Sub-Command |      Inherited     |
| :------: | :---: | :--------: | :---------: | :----------------: |
| Required |  `e`  | `expander` |     Add     | ✅ true (improved) |

## Details
- **Relation**: The *Expansion* is determined by a command's output instead of a fixed string
- **Value**: The command to execute for obtaining the replacement string
- **Single token**: Like `builtin abbr`, the *Expander* must only consist of a single command.
- **Use-case**: Dynamically generating expansions.
!!! tip "“Discard” expansion"
    You can simulate discarding of expansion by simply printing the *sub-command* back, changing nothing
!!! tip "Switch Combo"
    Pair it with [*Regular Expressions*][regexp]{data-preview} to generate *Expansion*s based on a dynamic [*Sub-Command*][subcommand]{data-preview} on the command-line

- **Implementation**: Not passed to `builtin abbr`. The command is executed manually, but the same arguments are passed.

## Usage
```fish {title="Format" .no-copy .no-select}
sub-abbr add … <EXPANDER FLAG> (?:`--`) …
```

### Command
- **Scope**: Unlike Fish, the command can be anything and may even include custom arguments.
- **Argument**: The *Expander* is called with the matched *Sub-Command* as the only argument

!!! tip "Sub-Command parameter in an Expander with arguments"
    In case of having the as a command with custom arguments, the *Sub-Command* will be the last argument

[expansion]: ../../../Positionals/Expansion.md
[regexp]: ./Regular-Expression.md "Match command-line arguments with RegExp"
[subcommand]: ../../../Positionals/Sub-Command.md "Token to match & replace"
