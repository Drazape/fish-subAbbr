---
status: index
comments: true
icon: lucide/flag
description: Switches accepted by the Add sub-command.
---

# Switches
Switches accepted by the [Add](../index.md){data-preview} sub-command.

| Name | Description | Long | Short | Value | Inherited [^inherited-switches] |
| :--: | ----------- | :--: | :---: | ----- | :-----------------------------: |
| [**RegExp**](./Regular-Expression.md){data-preview} | Match command-line arguments with Regular Expressions. Essential with [Sub-Command](../../../Common-Values/Components/Sub-Command.md){data-preview} for abbreviating the same pair of [*Sub-Command*](../../../Common-Values/Components/Sub-Command){data-preview} & [*Initial Arguments*](../../../Common-Values/Components/Initial-Arguments.md){data-preview} | `regex` | `r` | Multiple, optional | ⏫ extended |
| [**Expander**](./Expander.md){data-preview} | Use the output of a command as the [*Expansion*](../../../Common-Values/Components/Expansion.md){data-preview} | `expander` | `e` | None (toggle) | ⏫ extended |
| [**Base**](./Base.md){data-preview} | Specify the Base Commands the abbreviation triggers for | `base` | `b` | Required, variable | ✅ retained |
| [**Set Cursor**](./Set-Cursor.md){data-preview} | Set the cursor to a position. Same usage as the internal switch | `set-cursor` | `c` | Optional | ✅ retained | 
| [**Unprefix**](./Unprefix.md){data-preview} | Deactivate toleration of `$awabbre_prefix` before the *Base Command*; that is, do not expand the *Sub-Command* if the *Initial Args* are prefixed with `run0` | `unprefix` | `0` | None (toggle) | ❌ exclusive |
| [**Regard Flags**](./Regard-Flags.md){data-preview} | Acknowledge flags in the [*Initial Arguments*](../../../Common-Values/Components/Initial-Arguments.md){data-preview}; If not set, switches in the *Initial Arguments* are ignored | `regard-flags` | `s` | None (toggle) | ❌ exclusive |

[^inherited]: ✅ retained switches are passed to `abbr`; ⏫ extended switches add behavior; ❌ exclusive switches are specific to `awabbre`.
