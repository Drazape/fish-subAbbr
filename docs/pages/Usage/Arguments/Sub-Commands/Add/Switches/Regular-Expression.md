---
comments: true
description: Match command-line arguments with *Regular Expression*s
---

# Regular Expression
Match command-line arguments with *Regular Expression*s

## Properties
|       Values        | Short |   Long  | Sub-Command | Inherited |
| :-----------------: | :---: | :-----: | :---------: | :-------: |
| Multiple & Optional |  `r`  | `regex` |     Add     |     ✅    |

## Details
- **Values**
	- **`sub-command`**: Applies to the [*Sub-Command*](../../../Positionals/Sub-Command.md "Args preceding *Sub-Command*"){data-preview}
	- **`initials`**: Applies to the [*Initial Arguments*](../../../Positionals/Initial-Arguments.md "Args preceding"){data-preview}
- **Relation**
	- The [*Sub-Command*](../../../Positionals/Sub-Command.md "Args preceding *Sub-Command*"){data-preview}/[*Initial Arguments*](../../../Positionals/Initial-Arguments.md "Args preceding"){data-preview} turns into a RegExp instead of a fixed string (and may require escapes)
	- Providing [*Sub-Command*](../../../Positionals/Sub-Command.md "Args preceding *Sub-Command*"){data-preview} is still necessary, unlike `builtin abbr` where you can directly pass the regExp to the flag.
	- This switch is essential for multiple [*Initial Arguments*](../../../Positionals/Initial-Arguments.md "Args preceding"){data-preview} permutations paired with the same [*Sub-Command*](../../../Positionals/Sub-Command.md "Args preceding *Sub-Command*"){data-preview} (`builtin abbr`'s restriction)
> [!TIP]
> Use `string escape --style=regex` for [*Sub-Command*](../../../Positionals/Sub-Command.md "Args preceding *Sub-Command*"){data-preview} for multiple permutations

- **Single Token**: The *Regular Expression* is only matched against the individual arguments (not the entire command-line)
- **Use-case**: Matching command-line arguments dynamically
> [!TIP]
> Pair it with [*Expander*](Expander.md "Use a command's output as the *Expansion*"){data-preview} to generate [*Expansions*](../../../Positionals/Expansion.md "replacement string"){data-preview} based on the current command-line

- **Implementation**
	- **Sub-Command**: It is directly passed to `builtin abbr` with the [*Sub-Command*](../../../Positionals/Sub-Command.md "Args preceding *Sub-Command*"){data-preview} as the value
	- **Initial Arguments**: [*Initial Arguments*](../../../Positionals/Initial-Arguments.md "Args preceding"){data-preview} in itself is a `sub-abbr` exclusive feature. Thus, manually matched

## Usage
```fish {title="format"}
sub-abbr add … <REGEXP FLAG> (?:`--`) …
```
