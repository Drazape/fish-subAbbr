---
comments: true
icon: lucide/replace
description: The *Sub-Command* token to be matched on the command-line
---

# Sub-Command
The *Sub-Command* token to be matched on the command-line

## Details
Miscellaneous details about the *Sub-Command* token
### Relation with other positionals
Argument Position
:   The *Sub-Command* comes between the *Initial Arguments* and the *Expansion*

Command-line
:   Replaced with the *Expansion*
### Single Token
It must comprise only one token; that is, only one token can be replaced by the expansion. (Fish imposed; reasonable — since otherwise, it would be a UX nightmare)
### Customizable Behavior
[:lucide-settings: Regular Expressions](../../Sub-Commands/Add/Switches/Regular-Expression.md "Match command-line arguments with RegExp"){data-preview .md-button .md-button--primary} Plain String matching
:   The expansion occurs when the *Sub-Command* matches as a plain string, not Regex

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre add --base=<base-command> [<initial-arguments>] <SUB-COMMAND> <Expansion>
awabbre list [<initial-arguments>] --sub-command=<SUB-COMMAND>
```

!!! Example
    !!! note "Indication"
        The *Sub-Command*s are indicated in **Bold**

    - `#!fish awabbre add --base=jj `**`ci`**` commit`
    - `#!fish awabbre add -0c --base=run0 nh os `**`switch`**` 'switch % --bypass-root-check'`
    - `#!fish awabbre list --base=jj `**`ci`**
    - `#!fish awabbre list -0c --base=run0 nh os `**`--sub-command=switch`**
