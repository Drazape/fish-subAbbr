---
title: Mandatory Long
---

# Mandatory Long ^`mandatory-long`^
Enforce input for flags that require a value

## Effect
If the flag token is left without a value (`=` sign), then it puts you back to the flag's token in front of the `=`

## Positional
**Initials**
: The same as `sub-abbr`. Directly passed without any modification

### Switches
#### Un-inherited
- [RegExp: `sub-command`](../../../Arguments/Sub-Commands/Add/Switches/Regular-Expression.md "Match command-line arguments with RegExp"){data-preview}
- [Expander](../../../Arguments/Sub-Commands/Add/Switches/Expander.md "Use a command's output as the *Expansion*"){data-preview}
- [Set Cursor](../../../Arguments/Sub-Commands/Add/Switches/Set-Cursor.md "Position the cursor at `%`"){data-preview}

#### Exclusive
|    Name   |  Long  | Short |       Value        |             Description            |                Effect               |
| :-------: | :----: | :---: | :----------------: | ---------------------------------- | ----------------------------------- |
| Long Flag | `flag` |  `f`  | Required; variable | Mandatory long flags specification | Matches each of the specified flags |

!!! failure "Internal Regex Escaping"
    The flag is regex-escaped internally since the same flag is often used in different sub-commands for the same command. Hence you must not escape the flag yourself
