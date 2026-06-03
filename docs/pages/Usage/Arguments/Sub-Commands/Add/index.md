---
comments: true
---

# Add
Create context-aware sub-command abbreviations

## Properties
|  Name | Parent |
| :---: | :----: |
| `add` |  None  |

## Arguments
### Positionals
1. [**Initial Arguments**](../../Positionals/Initial-Arguments.md "Wiki Page"): precedes the *Sub-Command*. Becomes the new *Initial Arguments* for *Expansion*  
2. [**Sub-Command**](../../Positionals/Sub-Command.md "Wiki Page"): The *Sub-Command* to be replaced (expanded) by the *Expansion*. Comes after the *Initial Arguments*
3. [**Expansion**](../../Positionals/Expansion.md "Wiki Page"): The replacement (*Expansion*) of the typed *Sub-Command*. Becomes the new *Sub-Command* for the *Initial Arguments*
### Local Switches
| Name | Description | Long | Short | Inherited [^inherited-switches] |
| :--: | ----------- | :--: | :---: | :-----------------------------: |
| [**Degrade**](Switches/Degrade.md "Wiki Page") | Disable toleration of `run0` as the command prefix; i.e., do not expand the *Sub-Command* if the *Initial Args* is prefixed with `run0` | `degrade` | `0` | ❌ |
| [**Regard Flags**](Switches/Regard-Flags.md "Wiki Page") | Acknowledge flags in the *Initial Arguments*; If not set, switches in the *Initial Arguments* are ignored | `regard-flags` | `s` | ❌ |
| [**RegExp**](Switches/Regular-Expression.md "Wiki Page") | Match command-line arguments with Regular Expressions. Essential (with `subcommand`) for abbreviating the same pair of *Sub-Command* & *Initial Arguments* | `regex` | `r` | ✅ |
| [**Set Cursor**](Switches/Set-Cursor.md "Wiki Page") | Set the cursor to a position. Same usage as the internal switch | `set-cursor` | `c` | ✅ | 
| [**Expander**](Switches/Expander.md "Wiki Page") | Use the output of a command as the *Expansion* | `expander` | `e` | ✅ |

## Usage
```fish {title="format"}
sub-abbr add … <CREATION FLAGS> (?:`--`) …
```
