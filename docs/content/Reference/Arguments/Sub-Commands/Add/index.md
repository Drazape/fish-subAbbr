---
comments: true
icon: lucide/circle-plus
description: Create context-aware abbreviations
---

# Add
Create context-aware abbreviations

## Properties
|  Name | Parent |
| :---: | :----: |
| `add` |  None  |

## Arguments
Command-line arguments accepted by the *Add* sub-command
### Positionals
The *Add* sub-command accepts the positional arguments detailed in the following table:

| Position | Name | Presence |  Relation with other components |
| :------: | :--: | :------: |  ------------------------------ |
| `1`:`-3` | [Initial Arguments][initials]{data-preview} | Optional | precedes the [*Sub-Command*](../../Common-Values/Components/Sub-Command.md){data-preview}. Becomes the new *Initial Arguments* for *Expansion*[expansion] |
|   `-2`   | [Sub-Command][subcommand]{data-preview} | Required | The *Sub-Command* to be replaced (expanded) by the *Expansion*. Comes after the *Initial Arguments* |
|   `-1`   | [**Expansion**][expansion]{data-preview} | Required | The replacement (*Expansion*) of the typed *Sub-Command*. Becomes the new *Sub-Command* for the *Initial Arguments*

[initials]: ../../Common-Values/Components/Initial-Arguments.md
[subcommand]: ../../Common-Values/Components/Sub-Command.md
[expansion]: ../../Common-Values/Components/Expansion.md

### [Local Switches](./Switches/index.md){data-preview}

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre add --base=<base_commands>… [<creation_flags>] -- <initials> <sub-command> <expansion>
```
