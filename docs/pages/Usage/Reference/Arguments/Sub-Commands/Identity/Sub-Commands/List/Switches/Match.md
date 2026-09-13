---
comments: true
icon: lucide/equal-approximately
description: Filter listed identifiers by their sub-command match type
---

# Match
Filter the abbreviations listed by how their [Sub-Command][subcommand]{data-preview} is matched on the command-line

## Properties
| Value | Short |   Long  |     Sub-Command     | Inherited |
| :---: | :---: | :-----: | :-----------------: | :-------: |
|  Type |  `m`  | `match` | [List][list]{data-preview} |  ❌ false |

## Types
| Name | flag value | identifier prefix | Description |
| :--: | :--------: | :---------------: | :---------- |
| Fixed String | `fixed` | `=` | The sub-command must match the string exactly |
| [Regular Expression][regexp]{data-preview} | `regex` | `r` | The sub-command must match the regular expression |

!!! example "List abbrs with *RegExp*-matched *Sub-Command*"
    ```fish {title="Command"}
    sub-abbr identity list --match=regex
    ```
!!! example "List abbrs with exactly-matched *Sub-Command*"
    ```fish {title="Command"}
    sub-abbr identity list --match=fixed
    ```

!!! note "Both by default"
    If this switch isn't provided, both the types will be listed.


[subcommand]: ../../../../../Positionals/Sub-Command.md
[list]: ../index.md
[regexp]: ../../../../Add/Switches/Regular-Expression.md
