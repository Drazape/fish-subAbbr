---
comments: true
description: Dynamically expand using a command's output as the [*Expansion*](Expander.md "Use a command's output as the *Expansion*"){data-preview}) string
---

# Expander
Dynamically expand using a command's output as the [*Expansion*](Expander.md "Use a command's output as the *Expansion*"){data-preview}) string

## Properties
| Value| Short |    Long    | Sub-Command |   Inherited   |
| :--: | :---: | :--------: | :---------: | :-----------: |
| None |  `e`  | `expander` |     Add     | ✅ (improved) |

## Details
- **Relation**
	- The [*Expansion*](Expander.md "Use a command's output as the *Expansion*"){data-preview} is determined by a command's output instead of a fixed string
- **Single token**: Just like `builtin abbr`, the [*Expander*](Expander.md "Use a command's output as the *Expansion*"){data-preview} must only consist of a single command.
- **Use-case**: Dynamically generating expansions.
> [!TIP]
> Pair it with [*RegExp*](Regular-Expression.md "Match command-line arguments with RegExp"){data-preview} to generate [*Expansion*](Expander.md "Use a command's output as the *Expansion*"){data-preview}s based on a dynamic [*Sub-Command*](../../../Positionals/Sub-Command.md "Token to match & replace"){data-preview} on the command-line

- **Implementation**: Not passed to `builtin abbr`. The command is executed manually, but the same arguments are passed.

## Usage
```fish {title="format"}
sub-abbr add … <EXPANDER FLAG> (?:`--`) …
```

### Command
- **Scope**: Unlike Fish, the command can be anything and may even include custom arguments.
- **Argument**: The argument is called with the matched [*Sub-Command*](../../../Positionals/Sub-Command.md "Token to match & replace"){data-preview} as the only argument (in)

> [!TIP]
> In case of having the [*Expander*](Expander.md "Use a command's output as the *Expansion*"){data-preview} as a command with custom arguments, the [*Sub-Command*](../../../Positionals/Sub-Command.md "Token to match & replace"){data-preview} will be the last argument
