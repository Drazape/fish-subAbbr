---
comments: true
---

# Expander
Dynamically expand using a command's output as the [*Expansion*](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Function "Use a command's output as the *Expansion*")) string

## Properties
| Value| Short |    Long    | Sub-Command |   Inherited   |
| :--: | :---: | :--------: | :---------: | :-----------: |
| None |  `e`  | `expander` |     Add     | ✅ (improved) |

## Details
- **Relation**
	- The [*Expansion*](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Function "Use a command's output as the *Expansion*") is determined by a command's output instead of a fixed string
- **Single token**: Just like `builtin abbr`, the [*Expander*](https://github.com/Drazape/fish-subAbbr/wiki/switch-Expander "Use a command's output as the *Expansion*") must only consist of a single command.
- **Use-case**: Dynamically generating expansions.
> [!TIP]
> Pair it with [*RegExp*](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Regular-Expression "Match command-line arguments with RegExp") to generate [*Expansion*](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Function "Use a command's output as the *Expansion*")s based on a dynamic [*Sub-Command*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Sub-Command "Token to match & replace") on the command-line

- **Implementation**: Not passed to `builtin abbr`. The command is executed manually, but the same arguments are passed.

## Usage
```fish
sub-abbr add … <EXPANDER FLAG> (?:`--`) …
```

### Command
- **Scope**: Unlike Fish, the command can be anything and may even include custom arguments.
- **Argument**: The argument is called with the matched [*Sub-Command*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Sub-Command "Token to match & replace") as the only argument (in)

> [!TIP]
> In case of having the [*Expander*](https://github.com/Drazape/fish-subAbbr/wiki/switch-Expander "Use a command's output as the *Expansion*") as a command with custom arguments, the [*Sub-Command*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Sub-Command "Token to match & replace") will be the last argument
