---
comments: true
icon: lucide/terminal
description: List identifiers that accept all the specified Base Commands
---

# Base
Filter out the abbreviations that don't accept all the *Base Commands* specified as the value

## Properties
| Value | Short |   Long  |     Sub-Command     | Inherited |
| :---: | :---: | :-----: | :-----------------: | :-------: |
| Optional | `b` | `base` | [List][list]{data-preview} | ❌ false |

!!! note "Logical And"
    The listed identifiers must accept all the *Base Commands* specified as the value, not just one of them.
    In other words, when this switch is specified, the list of identifiers will be filtered to only include those that accept all the *Base Commands* specified as the value.

!!! note "Reusable with Add"
    To find abbreviations, you can use the same *Base* flag tokens that were used to create the abbreviation with the [Base flag of the Add sub-command][base-of-add]{data-preview}.


!!! example "List all abbreviations defined for Jujutsu"
    ```fish
    sub-abbr identity list --base=jj
    ```

!!! example "List all abbreviations defined for Nix helpers"
    ```fish
    sub-abbr identity list --base={nix,nh}
    ```

[list]: ../index.md
[base-of-add]: ../../../../Add/Switches/Base.md
