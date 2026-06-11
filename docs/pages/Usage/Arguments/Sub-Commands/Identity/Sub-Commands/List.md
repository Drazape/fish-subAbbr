---
comments: true
icon: lucide/list
description: List the identity of each content-aware abbreviation loaded
---

# List
List the identity of each content-aware abbreviation loaded

## Properties
|  Name  |  Parent  |
| :----: | :------: |
| `list` | [Identity](../index.md "Manage abbr by their identities"){data-preview} |

## Details
- **No local args**: This sub-command doesn't accept any local arguments
- **Uses**
	- Intuitively erasing content-aware abbreviations (in case of sub-command [RegExp](../../Add/Switches/Regular-Expression.md "Match *Sub-Command* with RegExp"){data-preview})
	- Checking if a specific abbreviation already exists
- **Implementation**: The output from `abbr` is parsed to get the identity encoded into the function name, which is further parsed to generate a human-intuitive identity
- **Single ID**: Unlike `abbr` which can have the same identity repeated (and would require the `--command` flag), this program uses a content-addressable identity

## Usage
```fish {title="format"}
sub-abbr <LIST FLAG>
```

### Output
- **Delimiter** (for each entry): New-line (`\n`)
- **Format**: (`~`|`r`)`: `*Base Command*` `*Initial Arguments*` `*Sub-Command*

!!! note
    *Sub-Command* in [Regular Expression](../../Add/Switches/Regular-Expression.md "Match *Sub-Command* with RegExp"){data-preview}s will be indicated with `r` prefixed to the initial `:`, while a fixed string *Sub-Command* will be `~:`*Sub-Command*
