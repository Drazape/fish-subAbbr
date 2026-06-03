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
1. [**Initial Arguments**](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Wiki Page"): precedes the *Sub-Command*. Becomes the new *Initial Arguments* for *Expansion*  
2. [**Sub-Command**](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Sub-Command "Wiki Page"): The *Sub-Command* to be replaced (expanded) by the *Expansion*. Comes after the *Initial Arguments*
3. [**Expansion**](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Expansion "Wiki Page"): The replacement (*Expansion*) of the typed *Sub-Command*. Becomes the new *Sub-Command* for the *Initial Arguments*
### Local Switches
| Name | Description | Long | Short | Inherited [^inherited-switches] |
| :--: | ----------- | :--: | :---: | :-----------------------------: |
| [**Degrade**](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Degrade "Wiki Page") | Disable toleration of `run0` as the command prefix; i.e., do not expand the *Sub-Command* if the *Initial Args* is prefixed with `run0` | `degrade` | `0` | ❌ |
| [**Regard Flags**](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Regard-Flags "Wiki Page") | Acknowledge flags in the *Initial Arguments*; If not set, switches in the *Initial Arguments* are ignored | `regard-flags` | `s` | ❌ |
| [**RegExp**](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Regular-Expression "Wiki Page") | Match command-line arguments with Regular Expressions. Essential (with `subcommand`) for abbreviating the same pair of *Sub-Command* & *Initial Arguments* | `regex` | `r` | ✅ |
| [**Set Cursor**](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Set-Cursor "Wiki Page") | Set the cursor to a position. Same usage as the internal switch | `set-cursor` | `c` | ✅ | 
| [**Expander**](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Expander "Wiki Page") | Use the output of a command as the *Expansion* | `expander` | `e` | ✅ |

## Usage
```fish {title="format"}
sub-abbr add … <CREATION FLAGS> (?:`--`) …
```
