---
comments: true
icon: lucide/text-initial
description: These are the arguments that must precede on the command-line for the *Sub-Command* to be expanded.
---

# Initial Arguments
These are the arguments that must precede on the command-line for the *Sub-Command* to be expanded.

## Properties
| Position | Required Arguments |
| :------: | :----------------: |
| `1`:`-3` |          1         |

!!! note "Requirement"
    This is the part that differentiates the built-in `abbr` from `sub-abbr`. If it is not to be passed, then `abbr` can be directly used.

## Details
- **Relation with other positionals**: The *Initial Arguments* given that precede the *Sub-Command* to be expanded become the *Initial Arguments* of the *Expansion* upon expansion
- **Variable Arguments**: Each argument is given separately. This is to ensure that the expansion occurs for equifinal token expansions.
### Customizable Behavior
- [⚙️](../Sub-Commands/Add/Switches/Regard-Flags.md "Acknowledge flags in Initial Args"){data-preview} **Ignored Flags**: Flags in the Initial Arguments on the command-line are ignored.
- [⚙️](../Sub-Commands/Add/Switches/Degrade.md "Disable `run0` toleration"){data-preview} **`run0` Acknowledgement**: Expansion will be considered even if the command is prefixed with `run0` for elevation.
- [⚙️](../Sub-Commands/Add/Switches/Regular-Expression.md "Match command-line arguments with RegExp"){data-preview}
	- **Single Permutation**: Due to Fish's internal restrictions, you cannot have the same *Sub-Command* with different [*Initial Argument*](./Initial-Arguments.md){data-preview} permutations (excluding the *Base Command* — the 1st argument) with plain text Sub-Command matching.
  - **Fixed String**: Each [*Initial Argument*](./Initial-Arguments.md){data-preview} is plainly matched

## Usage
```fish {title="format" .no-copy}
sub-abbr <INITIAL_ARGUMENTS> <Sub-Command> <Expansion>
```

!!! example
    !!! note "Indication"
        The [*Initial Arguments*](./Initial-Arguments.md){data-preview} are indicated in **Bold**

    - `sub-abbr `**`jj`**` ci commit`
    - `sub-abbr -0c `**`run0 nh os`**` switch 'switch % --bypass-root-check'`

## Implementation Details
Each argument is separately matched by parsing the command-line so that:

- The arguments don't include the *Base Command*
- `run0` is stripped out (unless [degraded](../Sub-Commands/Add/Switches/Degrade.md "Disable `run0` toleration"){data-preview})
- Any flags are stripped out (unless [regarded](../Sub-Commands/Add/Switches/Regard-Flags.md "Acknowledge flags in Initial Args"){data-preview})
