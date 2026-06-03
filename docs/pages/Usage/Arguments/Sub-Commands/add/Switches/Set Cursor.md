---
comments: true
---

# Set Cursor
Position the cursor at the separator present in the [*Expansion*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Sub-Command "Token to match & replace")

## Properties
|        Value       | Short |      Long    | Sub-Command | Inherited |
| :----------------: | :---: | :----------: | :---------: | :-------: |
| Optional: Position |  `c`  | `set-cursor` |     Add     |     ✅    |

## Details
- **Relation**
	- The cursor is put in a specific spot in the [*Expansion*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Sub-Command "Token to match & replace") (a ` ` is still appended after the [*Expansion*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Sub-Command "Token to match & replace") token)
	- The [*Expansion*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Sub-Command "Token to match & replace") can't include the same characters as *Position* before *Position itself*; *Position* is deleted from the [*Expansion*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Sub-Command "Token to match & replace"), with cursor taking its place
- **Use-case**: Putting arguments after the cursor; when there are arguments that need positioned before a specific argument
- **Implementation**: It is directly passed to `builtin abbr`, along with the value

## Usage
```fish {title="format"}
sub-abbr add … <SET-CURSOR FLAG> (?:`--`) …
```
