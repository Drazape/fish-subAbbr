---
comments: true
icon: lucide/circle-plus
description: Trigger for abbr creation
---

# Add
| Trigger | Event |
| :-----: | :---: |
| After abbr creation | `awabbre_add` |

## Tokens
When the event is emitted, the following arguments are passed to the hook functions:
- all the tokens passed by the user (to the [*Add* sub-command][add-subcommand]{data-preview} of `awabbre`), as is.
- the identifier of the created abbreviation as an additional final argument (after the [*Expansion*][expansion-positional]{data-preview}).

[expansion-positional]: ../../../Arguments/Common-Values/Components/Expansion.md
[add-subcommand]: ../../../Arguments/Sub-Commands/Add/index.md

## Example Uses
- Validation of created abbreviations
	* Generating specialized error messages and warnings
	* Prompting the user to erase potentially invalid ones
- Resolving conflicts with existing abbreviations
- Logging of created abbreviations
