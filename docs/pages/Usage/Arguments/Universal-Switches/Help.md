---
comments: true
icon: lucide/life-buoy
description: Show a reference manual for the given sub-command
---

# Help
Show a reference manual for the given sub-command

## Properties
| Value | Short |  Long  | Inherited |
| :---: | :---: | :----: | :-------: |
|  None |  `h`  | `help` |     ❌    |

## Details
- **Universal**: This switch is supported by all the sub-commands (and without any)
- **Relation with other arguments**: All the other switches are ignored with this one
- **Implementation**: It uses [*fish-helpText*](https://github.com/Drazape/fish-helpText "Fish library to generate formatted ANSI reference texts"){data-preview} for transpiling the input into ANSI
- **Use**: Doesn't do any operation. Only for recalling command usage

## Usage
```fish {title="format" .no-copy}
sub-abbr (?:<sub-command>) <HELP FLAG> (?:`--`) …
```

!!! info "Insignificance of Arguments"
    Any other arguments (`…`) have no significance

##### [output](https://github.com/Drazape/fish-helpText/#fish-subabbr "Library's showcase"){data-preview}
