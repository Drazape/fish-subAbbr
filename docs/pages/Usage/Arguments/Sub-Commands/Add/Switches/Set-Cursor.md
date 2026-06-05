---
comments: true
---

# Set Cursor
Position the cursor at the separator present in the [*Expansion*](../../../Positionals/Sub-Command.md "Token to match & replace"){data-preview}

## Properties
|        Value       | Short |      Long    | Sub-Command | Inherited |
| :----------------: | :---: | :----------: | :---------: | :-------: |
| Optional: Position |  `c`  | `set-cursor` |     Add     |     ✅    |

## Details
- **Relation**
	- The cursor is put in a specific spot in the [*Expansion*](../../../Positionals/Sub-Command.md "Token to match & replace"){data-preview} (a ` ` is still appended after the [*Expansion*](../../../Positionals/Sub-Command.md "Token to match & replace"){data-preview} token)
	- The [*Expansion*](../../../Positionals/Sub-Command.md "Token to match & replace"){data-preview} can't include the same characters as *Position* before *Position itself*; *Position* is deleted from the [*Expansion*](../../../Positionals/Sub-Command.md "Token to match & replace"){data-preview}, with cursor taking its place
- **Use-case**: Putting arguments after the cursor; when there are arguments that need positioned before a specific argument
- **Implementation**: It is directly passed to `builtin abbr`, along with the value

## Usage
```fish {title="format"}
sub-abbr add … <SET-CURSOR FLAG> (?:`--`) …
```
