---
comments: true
---

# Erase
Erase a content-aware abbreviation by its identity

## Properties
|  Name  |  Parent  |
| :----: | :------: |
| `list` | [Identity](https://github.com/Drazape/fish-subAbbr/wiki/Sub-Command:-Identity "Manage abbr by their identities") |

## Details
- **Identity**: The identity can be obtained from the [List sub-command](https://github.com/Drazape/fish-subAbbr/wiki/ID:-List "Get identities of loaded abbrs")
- **Uses**: Intuitively deletion in case of [RegExp](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Regular-Expression "Match *Sub-Command* with RegExp") context-aware abbreviations
- **Implementation**: The human ID is converted into the ID identified by `builtin abbr`
	- *RegExp*: the entire command-line
	- *Fixed String*: The Sub-Command (`builtin abbr` limitation)

> [!TIP]
> In case of Fixed Strings, it is always more intuitive to use the built-in `abbr --erase <Sub-Command>` (interactively)

## Arguments
1. [**Initial Arguments**](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Wiki Page"): The *Initial Arguments* passed during creation
2. [**Sub-Command**](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Sub-Command "Wiki Page"): The *Sub-Command* passed during creation

## Usage
```fish {title="format"}
sub-abbr identity erase <INITIAL ARGUMENTS> <SUB-COMMANDS>
```
