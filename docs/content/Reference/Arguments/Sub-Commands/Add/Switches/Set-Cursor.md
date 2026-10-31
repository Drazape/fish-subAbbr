---
comments: true
icon: lucide/map-pin
description: Position the cursor at the separator present in the [*Expansion*](../../../Common-Values/Components/Sub-Command.md "Token to match & replace"){data-preview}
---

# Set Cursor
Position the cursor at the separator present in the [*Expansion*](../../../Common-Values/Components/Sub-Command.md "Token to match & replace"){data-preview}

## Properties
|   Value  | Short |      Long    | Sub-Command | Inherited |
| :------: | :---: | :----------: | :---------: | :-------: |
| Optional |  `c`  | `set-cursor` | [Add](../index.md){data-preview} | ✅ true |

## Details
Miscellaneous details about the switch
### Relation
- The cursor is put in a specific spot in the [*Expansion*](../../../Common-Values/Components/Sub-Command.md "Token to match & replace"){data-preview} (a ` ` is still appended after the [*Expansion*](../../../Common-Values/Components/Sub-Command.md "Token to match & replace"){data-preview} token)
- The [*Expansion*](../../../Common-Values/Components/Sub-Command.md "Token to match & replace"){data-preview} can't include the same characters as *Position* before *Position itself*; *Position* is deleted from the [*Expansion*](../../../Common-Values/Components/Sub-Command.md "Token to match & replace"){data-preview}, with cursor taking its place
### Value
The string to replace with the cursor (default: `%`)
### Use-case
Putting arguments after the cursor; when there are arguments that need positioned before a specific argument

!!! info "Implementation"
    It is directly passed to `builtin abbr`, along with the value

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre add --base=<base-command>… {-c|--set-cursor} [<creation-flags>…] -- <initials> <sub-command> <expansion>
```
