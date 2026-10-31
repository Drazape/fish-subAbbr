---
comments: true
icon: lucide/eraser
description: Erase a content-aware abbreviation by its identifier
---

# Erase
Erase a content-aware abbreviation by its identifier

## Properties
|   Name  | Positional Values |
| :-----: | :---------------: |
| `erase` | Required |

## Details
Identifier Obtainment
:   The [identifier](../Common-Values/Identifier.md){data-preview} can be obtained from the [List sub-command](./List/index.md "Get identities of loaded abbrs"){data-preview}

Uses
:   Intuitively deletion in case of [RegExp](./Add/Switches/Regular-Expression.md "Match *Sub-Command* with RegExp"){data-preview} context-aware abbreviations

!!! info "Implementation"
    The human ID is converted into the ID identified by `builtin abbr`
    - *RegExp*: the entire command-line
    - *Fixed String*: The Sub-Command (`builtin abbr` limitation)

!!! tip "Alt Fixed Strings eraser"
    In case of Fixed Strings, it is always more intuitive to use the built-in `#!fish abbr --erase <Sub-Command>` (interactively)

## Arguments
1. [**Initial Arguments**](../Common-Values/Components/Initial-Arguments.md "Wiki Page"){data-preview}: The *Initial Arguments* passed during creation
2. [**Sub-Command**](../Common-Values/Components/Sub-Command.md "Wiki Page"){data-preview}: The *Sub-Command* passed during creation

## Usage
```fish {title="Format" .no-copy .no-select}
awabbre erase [<IDENTIFIER>…]
```
