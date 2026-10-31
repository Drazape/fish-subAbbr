---
comments: true
icon: lucide/equal-approximately
description: Filter listed identifiers by their Initials match type
---

# Match
Filter the abbreviations listed by how their [Initial Arguments][initials]{data-preview} is matched on the command-line

## Properties
| Value | Short |   Long  |     Sub-Command     | Inherited |
| :---: | :---: | :-----: | :-----------------: | :-------: |
|  Type |  `m`  | `match` | [List][list]{data-preview} |  ❌ false |

!!! note "Different than Initials Regex filtering"
    This switch is different than the [Regular Expressions][./Regular-Expressions.md]{data-preview} switch, which filters the listed identifiers by interpreting the listed positionals as regular expressions rather than fixed strings.
    Whereas this switch filters the listed identifiers by their *Initial Arguments* match type as defined during their [addition][add]{data-preview}.  

## Types
| Name | flag value | identifier prefix | Description |
| :--: | :--------: | :---------------: | :---------- |
| Fixed String | `fixed` | `=` | The [*Initial Arguments*][initials]{data-preview} must match the string exactly |
| [Regular Expression][regexp]{data-preview} | `regex` | `r` | The *Initial Arguments* must match the regular expression |

!!! example "List abbrs with *RegExp*-matched Initials"
    ```fish {title="Command"}
    awabbre list --match=regex
    ```
!!! example "List abbrs with exactly-matched Initials"
    ```fish {title="Command"}
    awabbre list --match=fixed
    ```

!!! note "Both by default"
    If this switch isn't provided, both the types will be listed.


[initials]: ../../../Common-Values/Components/Initial-Arguments.md
[list]: ../index.md
[regexp]: ../../Add/Switches/Regular-Expression.md
[add]: ../../Add/index.md
