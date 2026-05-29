---
comments: true
---

# Regular Expression
Match command-line arguments with *Regular Expression*s

## Properties
|       Values        | Short |   Long  | Sub-Command | Inherited |
| :-----------------: | :---: | :-----: | :---------: | :-------: |
| Multiple & Optional |  `r`  | `regex` |     Add     |     ✅    |

## Details
- **Values**
	- **`sub-command`**: Applies to the [*Sub-Command*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Args preceding *Sub-Command*")
	- **`initials`**: Applies to the [*Initial Arguments*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Args preceding")
- **Relation**
	- The [*Sub-Command*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Args preceding *Sub-Command*")/[*Initial Arguments*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Args preceding") turns into a RegExp instead of a fixed string (and may require escapes)
	- Providing [*Sub-Command*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Args preceding *Sub-Command*") is still necessary, unlike `builtin abbr` where you can directly pass the regExp to the flag.
	- This switch is essential for multiple [*Initial Arguments*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Args preceding") permutations paired with the same [*Sub-Command*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Args preceding *Sub-Command*") (`builtin abbr`'s restriction)
> [!TIP]
> Use `string escape --style=regex` for [*Sub-Command*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Args preceding *Sub-Command*") for multiple permutations

- **Single Token**: The *Regular Expression* is only matched against the individual arguments (not the entire command-line)
- **Use-case**: Matching command-line arguments dynamically
> [!TIP]
> Pair it with [*Expander*](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Expander "Use a command's output as the *Expansion*") to generate [*Expansions*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Expansion "replacement string") based on the current command-line

- **Implementation**
	- **Sub-Command**: It is directly passed to `builtin abbr` with the [*Sub-Command*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Args preceding *Sub-Command*") as the value
	- **Initial Arguments**: [*Initial Arguments*] in itself is a `sub-abbr` exclusive feature. Thus, manually matched

## Usage
```fish
sub-abbr add … <REGEXP FLAG> (?:`--`) …
```
