---
comments: true
icon: lucide/id-card
description: Trigger before gathering identities
---

# Gather Identifiers
| Trigger | Event |
| :-----: | :---: |
| Before gathering identities | `awabbre_gather-identifiers` |

## Tokens
The hook functions may be passed the following fixed tokens as arguments.  
These tokens are optional data scopes that `awabbre` has requested:
`commands`
:   These are commands the `abbr` built-in internally looks for. Other than the [Base Command][base-command-add-switch]{data-preview}, it also includes all the [prefix][prefix-config]{data-preview} tokens.

[base-command-add-switch]: ../../../Arguments/Sub-Commands/Add/Switches/Base.md
[prefix-config]: ../../../Configuration/Prefix.md

`description`
:   This is the internal description passed to the `abbr` built-in by `awabbre`. It embeds all the information passed to [Add][add-subcommand]{data-preview}, other than the Base Commands and the [Initial Arguments][initials-positional]{data-preview}, for they are already embedded in the identifier.

[add-subcommand]: ../../../Arguments/Sub-Commands/Add/index.md
[initials-positional]: ../../../Arguments/Common-Values/Components/Initial-Arguments.md

## Example Use: universal identity management
### Problem: unloaded abbreviations
Take a case of a package that loads context-aware abbreviation by an unofficially supported method.  
With this method, instead of loading the abbreviation during shell initialization, the abbreviation is loaded on a certain condition, later in the shell session, solely for the purpose of optimizing resource usage.  
In this scenario, the user might not be able to [list][list-subcommand]{data-preview} or [erase][erase-subcommand]{data-preview} abbreviations because the abbreviation is not loaded yet.

[list-subcommand]: ../../../Arguments/Sub-Commands/List/index.md
[erase-subcommand]: ../../../Arguments/Sub-Commands/Erase.md

### Solution
Besides the optimized condition, the package can also load the abbreviation when the user attempts to list or erase abbreviations; that is, by listening to the `awabbre_gather-identifiers` event.
