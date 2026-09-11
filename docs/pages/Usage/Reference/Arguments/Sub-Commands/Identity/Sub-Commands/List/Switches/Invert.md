---
comments: true
icon: lucide/rotate-ccw
description: Invert the filters applied applied to the abbreviations that to be listed
---

# Invert
Invert the filters applied using the other arguments, to the abbreviations that to be listed

## Properties
| Value | Short |   Long   |     Sub-Command     | Inherited |
| :---: | :---: | :------: | :-----------------: | :-------: |
|  Type |  `i`  | `invert` | [List][list]{data-preview} |  ❌ false |

The command can invert both the [positionals][positionals]{data-preview}, and the switches applied.

!!! example "List abbreviations not made for Jujutsu"
    ```fish {title="Command"}
    sub-abbr identity list --invert jj
    ```


[positionals]: ../Positionals.md
[list]: ../index.md
