---
comments: true
icon: lucide/list
description: List the identifier of each content-aware abbreviation loaded
---

# List
List the identifier of each content-aware abbreviation loaded

## Properties
|  Name  |  Parent  |
| :----: | :------: |
| `list` | [Identity](../../index.md "Manage abbr by their identifiers"){data-preview} |

## Details
### Uses
- Intuitively erasing content-aware abbreviations in case of when the sub-command is matched with [Regular Expressions][RegExp]{data-preview})
- Checking if a specific abbreviation already exists
- Selectively erasing the filtered content-aware abbreviations
### Arguments
All the arguments of this command ([switches](./Switches/){data-preview} and [positionals](./Positionals.md){data-preview}) filter the abbreviations listed by solely the information encoded in their identifiers—the information just enough to generate a unique identifier for each abbreviation (see the [output](#output) to know the components included in the identifier)
### Implementation
The output from `abbr` is parsed to get the identifier encoded into the function name, which is further parsed to generate a human-intuitive identifier
### Single ID
Unlike `abbr` which can have the same identifier repeated (and would require the `--command` flag), this program uses a content-addressable identifier

## Usage
```fish {title="Format" .no-copy .no-select}
sub-abbr <LIST FLAG>
```

### Output
- **Delimiter** (for each entry): New-line (`\n`)
- **Format**: (`=`|`r`)`: `[*Initial Arguments*][initials]{data-preview}` `[*Sub-Command*][subcommand]{data-preview}

!!! note "Sub-command matching indication"
    The character before the initial `:` indicates weather the *Sub-Command* is matched with [Regular Expression][RegExp]{data-preview}

    | Prefix |                   Matches                   |
    | :----: | :-----------------------------------------: |
    |   `r`  |  [Regular Expression][RegExp]{data-preview} |
    |   `=`  |                 Fixed String                |

[RegExp]: ../../../Add/Switches/Regular-Expression.md
[initials]: ../../../../Positionals/Initial-Arguments.md
[subcommand]: ../../../../Positionals/Sub-Command.md
