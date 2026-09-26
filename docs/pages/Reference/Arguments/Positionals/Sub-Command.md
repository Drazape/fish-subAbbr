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
Miscallaneous details about the sub-command
### Relation with other positionals
Argument Position
:   The *Sub-Command* comes between the *Initial Arguments* and the *Expansion*
Command-line
:   Replaced with the *Expansion*
### Single Token
It must comprise only one token; that is, only one token can be replaced by the expansion. (Fish imposed; reasonable — since otherwise, it would be a UX nightmare)
### Customizable Behavior
- [:lucide-settings: toggle️](../Sub-Commands/Add/Switches/Regular-Expression.md "Match command-line arguments with RegExp"){data-preview .md-button .md-button--primary} **Plain String matching**: The expansion occurs when the *Sub-Command* matches as a plain string, not Regex

## Usage
```fish {title="Format" .no-copy .no-select}
sub-abbr <initial-arguments> <SUB-COMMAND> <Expansion>
```

!!! Example
    !!! note "Indication"
        The *Sub-Command*s are indicated in **Bold**

    - `#!fish sub-abbr add jj `**`ci`**` commit`
    - `#!fish sub-abbr add -0c run0 nh os `**`switch`**` 'switch % --bypass-root-check'`
    - `#!fish sub-abbr identity list jj `**`ci`**
    - `#!fish sub-abbr identity list -0c run0 nh os `**`switch`**
