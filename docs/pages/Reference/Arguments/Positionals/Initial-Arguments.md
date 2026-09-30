---
comments: true
icon: lucide/text-initial
description: These are the arguments that must precede on the command-line for the *Sub-Command* to be expanded.
---

# Initial Arguments
These are arguments to the [*Base Command*](../Sub-Commands/Add/Switches/Base.md){data-preview} that, if specified, must precede the [*Sub-Command*](./Sub-Command.md){data-preview} on the command-line for the *Sub-Command* to be expanded.

## Properties
| Position |  Minimum Arguments |
| :------: | :----------------: |
| `1`:`-3` |          1         |

!!! note "Requirement"
    This is the part that differentiates the built-in `abbr` from `sub-abbr`. If it is not to be passed, then `abbr` can be directly used.

## Details
Relation with other positionals
:   The *Initial Arguments* given that precede the *Sub-Command* to be expanded become the *Initial Arguments* of the *Expansion* upon expansion

Variable Arguments
:   Each argument is given separately. This is to ensure that the expansion occurs for equifinal token expansions.
### Customizable Behavior
[:lucide-settings: Regard Flags](../Sub-Commands/Add/Switches/Regard-Flags.md "Acknowledge flags in Initial Args"){data-preview .md-button .md-button--primary} Ignored Flags
:   Flags in the Initial Arguments on the command-line are ignored.

[:lucide-settings: Unprefix](../Sub-Commands/Add/Switches/Unprefix.md "Deactivate `run0` toleration"){data-preview .md-button .md-button--primary} `run0` Acknowledgement
:   Expansion will be considered even if the command is prefixed with `run0` for elevation.

[:lucide-settings: Regular Expressions](../Sub-Commands/Add/Switches/Regular-Expression.md "Match command-line arguments with RegExp"){data-preview .md-button .md-button--primary} Single Permutation
:   Due to Fish's internal restrictions, you cannot have the same *Sub-Command* with different [*Initial Argument*](./Initial-Arguments.md){data-preview} permutations with plain text *Sub-Command* matching.

[:lucide-settings: Regular Expressions](../Sub-Commands/Add/Switches/Regular-Expression.md "Match command-line arguments with RegExp"){data-preview .md-button .md-button--primary} Fixed String
:   Each [*Initial Argument*](./Initial-Arguments.md){data-preview} is plainly matched

## Usage
```fish {title="Format" .no-copy .no-select}
sub-abbr add --base=<base-command> … -- (?:<INITIAL_ARGUMENTS>) <Sub-Command> <Expansion>
sub-abbr identity list … (?:<INITIAL_ARGUMENTS>) <Sub-Command>
```

!!! example
    !!! note "Indication"
        The [*Initial Arguments*](./Initial-Arguments.md){data-preview} are indicated in **Bold**

    - `#!fish sub-abbr add --base=jj ci commit` (does not use *Initial Arguments*)
    - `#!fish sub-abbr add --base=run0 -0c `**`nh os`**` switch 'switch % --bypass-root-check'`
    - `#!fish sub-abbr identity list --base=run0 `**`nh os`**` switch`

## Implementation Details
Each argument is separately matched by parsing the command-line as follows:

1. `run0` is stripped out (unless [Unprefixed](../Sub-Commands/Add/Switches/Unprefix.md){data-preview})
2. All the arguments are captured
3. Any flags found are stripped out (unless [regarded](../Sub-Commands/Add/Switches/Regard-Flags.md "Acknowledge flags in Initial Args"){data-preview})
