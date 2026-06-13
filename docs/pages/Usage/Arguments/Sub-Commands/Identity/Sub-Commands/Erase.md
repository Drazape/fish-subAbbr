---
comments: true
icon: lucide/eraser
description: Erase a content-aware abbreviation by its identity
---

# Erase
Erase a content-aware abbreviation by its identity

## Properties
|  Name  |  Parent  |
| :----: | :------: |
| `list` | [Identity](../index.md "Manage abbr by their identities"){data-preview} |

## Details
- **Identity**: The identity can be obtained from the [List sub-command](List.md "Get identities of loaded abbrs"){data-preview}
- **Uses**: Intuitively deletion in case of [RegExp](../../Add/Switches/Regular-Expression.md "Match *Sub-Command* with RegExp"){data-preview} context-aware abbreviations
- **Implementation**: The human ID is converted into the ID identified by `builtin abbr`
	- *RegExp*: the entire command-line
	- *Fixed String*: The Sub-Command (`builtin abbr` limitation)

!!! tip "Alt Fixed Strings eraser"
    In case of Fixed Strings, it is always more intuitive to use the built-in `abbr --erase <Sub-Command>` (interactively)

## Arguments
1. [**Initial Arguments**](../../../Positionals/Initial-Arguments.md "Wiki Page"){data-preview}: The *Initial Arguments* passed during creation
2. [**Sub-Command**](../../../Positionals/Sub-Command.md "Wiki Page"){data-preview}: The *Sub-Command* passed during creation

## Usage
```fish {title="format" .no-copy}
sub-abbr identity erase <INITIAL ARGUMENTS> <SUB-COMMANDS>
```
