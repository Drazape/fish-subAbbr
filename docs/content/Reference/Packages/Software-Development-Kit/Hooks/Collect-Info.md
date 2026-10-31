---
comments: true
icon: lucide/info
description: Trigger before collecting info about an abbr
---

# Collect Info
| Trigger | Event |
| :-----: | :---: |
| After displaying information about an identifier | `awabbre_collect-info` |

## Tokens
The definition of the abbreviation as given by [Show][show-subcommand]{data-preview} in a machine parsable format, that is, as it is passed to [Add][add-subcommand]{data-preview}.

[show-subcommand]: ../../../Arguments/Sub-Commands/Show.md
[add-subcommand]: ../../../Arguments/Sub-Commands/Add/index.md

## Example Use: Displaying additional information
The functions that trigger on the event can display additional specialized information to the human user.
!!! note "Additional info to machine"
    If another program wants the additional data, it should directly call the hook function for that.
This is especially used for wrappers as it almost always has some unique information and also information hidden from `awabbre`.
