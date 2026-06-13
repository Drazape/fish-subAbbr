---
comments: true
icon: lucide/flag
description: Acknowledge flags part of the *Initial Arguments*
---

# Regard Flags
Acknowledge flags part of the *Initial Arguments*

## Properties
| Value | Short |      Long      | Sub-Command | Inherited |
| :---: | :---: | :------------: | :---------: | :-------: |
|  None |  `s`  | `regard-flags` |     Add     |     ❌    |

## Details
- **Relation**: [*Initial Arguments*](../../../Positionals/Initial-Arguments.md "Args preceding *Sub-Command*"){data-preview} (command-line): flags — if found as one of the [*Initial Arguments*](../../../Positionals/Initial-Arguments.md "Args preceding *Sub-Command*"){data-preview} — aren't ignored, and must match for the expansion to occur
- **Use-case**: Abbreviations only meaningful with a specific flag
- **Effect**: It doesn't affect the passed *Initial Arguments*'s parsing, but makes abbreviations with flags passed (before `--`, obviously) expandable
- **Implementation**: It otherwise uses `builtin argparse` to filter the flags (ignoring positionals disguised as "flags" after `--`)

## Usage
```fish {title="format" .no-copy .no-select}
sub-abbr add … <REGARD-FLAGS FLAG> (?:`--`) …
```

!!! example
    #### `eza` Git status only in the long form with icons
    Only show the Git status of files when in the long form, and icons are turned on
    ```fish {title="command" .no-select}
    sub-abbr add -s -- eza --long --icons{,\ --git}
    ```
