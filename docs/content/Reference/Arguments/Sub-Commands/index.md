---
status: index
comments: true
icon: lucide/squares-subtract
description: Operations provided by the awabbre command.
---

# Sub-Commands
Operations that can be performed using `awabbre`.

## Sub-Commands
| Sub-Command | Operation | Positionals | Arguments |
| ----------- | --------- | ----------- | --------- |
| [Add](Add/index.md){data-preview} | Create a context-aware abbreviation. | [Initial Arguments][initials]{data-preview}, [Sub-Command][subcommand]{data-preview}, [Expansion][expansion]{data-preview} | [Switches](Add/Switches/index.md){data-preview} |
| [List](List/index.md){data-preview} | List identifiers of loaded abbreviations, optionally filtered. | [Initial Arguments][initials]{data-preview}, [Sub-Command][subcommand]{data-preview} | [Positionals](List/Positionals.md){data-preview}, [Switches](List/Switches/index.md){data-preview} |
| [Show](Show.md){data-preview} | Print definitions in the format accepted by Add. | Identifiers (optional; all when omitted) | — |
| [Erase](Erase.md){data-preview} | Erase abbreviations by identifier. | Identifiers | — |

[initials]: ../Common-Values/Components/Initial-Arguments.md
[subcommand]: ../Common-Values/Components/Sub-Command.md
[expansion]: ../Common-Values/Components/Expansion.md
