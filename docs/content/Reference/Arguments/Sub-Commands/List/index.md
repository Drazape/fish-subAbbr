---
comments: true
icon: lucide/list
description: List the identifier of each content-aware abbreviation loaded
---

# List
List the [identifier][identifier]{data-preview} of each content-aware abbreviation loaded

## Properties
|  Name  | Positional Values |
| :----: | :---------------: |
| `list` | Required |

## Details
Miscellaneous details about the sub-command

!!! info "Why separate data inputs"
    While *Erase* and *Show* could have simply used the same intuitive input as *List*, that is not done because Fish only supports Lists as the built-in data structures. If we were to use the input that List accepts, then that would itself be several tokens, that is, a list on its own.
    Essentially, the user storing multiple identifiers (for any purpose) would have to work it around somehow; that could be possibly done by:

    - Storing a [list of variable strings that each point to a separate identifier][dereference-variables]. This method is native to Fish, and is easier. If this method is used, if the identifiers are to be passed around—which is their entire purpose, one would have to either make the variables global, or call the command repeatedly; this easily makes this method impractical for all most scenarios.
    - Storing each of the identifiers as a parsable string in a List, which is later parsed by the commands. This is the current internal implementation, since it is the only implementation possible out of the 2 to be directly embedded into the command.

    [dereference-variables]: https://fishshell.com/docs/current/language.html#dereferencing-variables "Official Fish Shell documentaiton on Dereferencing variables"

    If an internal implementation is not maintained, each of the commands the identifiers are passed to would have to manually do this labor.

    Even if Fish supported more complex data structures, List would still remain the preferred way to pass identifiers because of the filtering options it provides.

### Uses
- Intuitively erasing content-aware abbreviations in case of when the sub-command is matched with [Regular Expressions][RegExp]{data-preview})
- Checking if a specific abbreviation already exists
- Selectively erasing the filtered content-aware abbreviations
### Arguments
All the arguments of this command ([switches](./Switches/){data-preview} and [positionals](./Positionals.md){data-preview}) filter the abbreviations listed by solely the information encoded in their identifiers—the information just enough to generate a unique identifier for each abbreviation (see the [output](#output) to know the components included in the identifier)
### Single ID
Unlike `abbr` which can have the same identifier repeated (and would require the `--command` flag), this program uses a content-addressable [identifier][identifier]{data-preview} to uniquely identify each abbreviation.

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre list [<flags>… -- Initials Sub-Command]
```

### Output
- **Delimiter** (for each entry): New-line (`\n`)
- **Format**: (`=`|`r`)`: `[*Initial Arguments*][initials]{data-preview}` `[*Sub-Command*][subcommand]{data-preview}

!!! note "Sub-command matching indication"
    The character before the initial `:` indicates weather the *Sub-Command* is matched with [Regular Expression][RegExp]{data-preview}

    | Prefix |                   Matches                   |
    | :----: | :-----------------------------------------: |
    |   `r`  |  [Regular Expression][RegExp]{data-preview} |
    |   `=`  |                 Fixed String                |

[RegExp]: ../Add/Switches/Regular-Expression.md
[initials]: ../../Common-Values/Components/Initial-Arguments.md
[subcommand]: ../../Common-Values/Components/Sub-Command.md
[identifier]: ../../Common-Values/Identifier.md
