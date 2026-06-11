---
comments: true
icon: lucide/replace
description: The *Sub-Command* token to be matched on the command-line
---

# Sub-Command
The *Sub-Command* token to be matched on the command-line

## Properties
| Position | Presence |
| :------: | :------: |
|   `-2`   | Required |

## Details
- **Relation with other positionals**
	- **Argument Position**: The *Sub-Command* comes between the *Initial Arguments* and the *Expansion*
	- **Command-line**: Replaced with the *Expansion*
- **Single Token**: It must comprise of only one token; i.e., only one token can be replaced by the expansion. (Fish imposed; reasonable: UX)
### Customizable Behavior
- [⚙️](../Sub-Commands/Add/Switches/Regular-Expression.md "Match command-line arguments with RegExp"){data-preview} **Plain String matching**: The expansion occurs when the *Sub-Command* matches as a plain string, not Regex

## Usage
```fish {title="format"}
sub-abbr <initial-arguments> <SUB-COMMAND> <Expansion>
```

### Examples
!!! note "Indication"
    The *Sub-Command*s are indicated in **Bold**

- `sub-abbr jj `**`ci`**` commit`
- `sub-abbr -0c run0 nh os `**`switch`**` 'switch % --bypass-root-check'`
