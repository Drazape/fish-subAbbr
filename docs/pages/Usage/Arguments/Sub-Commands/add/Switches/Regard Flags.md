---
comments: true
---

# Regard Flags
Acknowledge flags part of the *Initial Arguments*

## Properties
| Value | Short |      Long      | Sub-Command | Inherited |
| :---: | :---: | :------------: | :---------: | :-------: |
|  None |  `s`  | `regard-flags` |     Add     |     ❌    |

## Details
- **Relation**: [*Initial Arguments*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Args preceding *Sub-Command*") (command-line): flags — if found as one of the [*Initial Arguments*](https://github.com/Drazape/fish-subAbbr/wiki/Positional:-Initial-Arguments "Args preceding *Sub-Command*") — aren't ignored, and must match for the expansion to occur
- **Use-case**: Abbreviations only meaningful with a specific flag
- **Effect**: It doesn't affect the passed *Initial Arguments*'s parsing, but makes abbreviations with flags passed (before `--`, obviously) expandable
- **Implementation**: It otherwise uses `builtin argparse` to filter the flags (ignoring positionals disguised as "flags" after `--`)

## Usage
```fish
sub-abbr add … <REGARD-FLAGS FLAG> (?:`--`) …
```

### Examples
#### `eza` Git status only in the long form with icons
Only show the Git status of files when in the long form, and icons are turned on
```fish
sub-abbr add -s -- eza --long --icons{,\ --git}
```
