---
comments: true
icon: lucide/chevron-left
description: Set prefixes tolerable by Base Command
---

# Base Prefix
Configure the prefixes that will be tolerated if they precede the Base Command

| Name | Accepted Values | Default |
| :--: | :-------------: | :-----: |
| `subabbr_prefix` | Base Commands | `run0` `sudo` `doas` |

!!! example "Elevation with `run0`"
    If `$subabbr_prefix` is set to `run0`, then all abbrevations would expand even if the actual Base Command is preceded by `run0` for privilege escalation.

    ```fish {title="Command"}
    sub-abbr add -- cp -r --recursive
    ```
    If you create the preceding abbreviation while `$subabbr_prefix` is set to `run0`, the expansion would be performed regardless if the command is prepended by `run0`; that is, it would work for both the following command-line buffers:
    - `cp -r` → `cp --recursive`
    - `run0 cp -r` → `run0 cp --recursive`

## Values
The variable can have any number of tokens.

These tokens are Base Commands that, if added to `$subabbr_prefix`, are ignored if encountered before the actual Base Command.

If no value is set, then the prefixes default to the tokens `run0`, `sudo`, and `doas`.

!!! warning "Prior Definition required"
    The value must be set prior to any abbreviation is added, or any packages are loaded.

    While fish-subAbbr itself can adapt to the modified configuration value, Fish abbreviations are internally immutable; that is, you cannot override the Base Commands once defined.

!!! warning "Multiple Definitions"
    If you have multiple elevaters installed on your system, then `subabbr_prefix` would be set for each one of them.
    That doesn't pose a problem from `fish-subAbbr` itself, but certain packages might have to multiply the number of abbreviations they have to create to support all the prefixes.

    !!! info "Multiplication Requirement"
    The abbreviations can multiply as packages might create certain abbreviations that are conditioned to only work if their command is prefixed to the abbreviation.
    In such a scenario, they have to loop over the prefixes to create an abbreviation for each of them.

    Though Fish internally supports multiple Base Commands, no such support is provided by fish-subAbbr; this issue could be addressed later.

