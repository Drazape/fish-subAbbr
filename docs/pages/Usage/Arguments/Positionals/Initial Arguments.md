---
comments: true
---

# Initial Arguments
These are the arguments that must precede on the command-line for the *Sub-Command* to be expanded.

## Properties
| Position | Required Arguments |
| :------: | :----------------: |
| `1`:`-3` |          1         |

> [!NOTE]
> ### Requirement
> This is the part that differentiates the built-in `abbr` from `sub-abbr`. If it is not to be passed, then `abbr` can be directly used.

## Details
- **Relation with other positionals**: The *Initial Arguments* given that precede the *Sub-Command* to be expanded become the *Initial Arguments* of the *Expansion* upon expansion
- **Variable Arguments**: Each argument is given separately. This is to ensure that the expansion occurs for equifinal token expansions.
### Customizable Behavior
- [⚙️](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Regard-Flags "Acknowledge flags in Initial Args") **Ignored Flags**: Flags in the Initial Arguments on the command-line are ignored.
- [⚙️](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Degrade "Disable `run0` toleration") **`run0` Acknowledgement**: Expansion will be considered even if the command is prefixed with `run0` for elevation.
- [⚙️](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Regular-Expression "Match command-line arguments with RegExp")
	- **Single Permutation**: Due to Fish's internal restrictions, you cannot have the same *Sub-Command* with different *Initial Argument* permutations (excluding the *Base Command* — the 1st argument) with plain text Sub-Command matching.
  - **Fixed String**: Each *Initial Argument* is plainly matched

## Usage
```fish
sub-abbr <INITIAL_ARGUMENTS> <Sub-Command> <Expansion>
```

### Examples
> [!NOTE]
> The *Initial Arguments* are indicated in **Bold**

- `sub-abbr `**`jj`**` ci commit`
- `sub-abbr -0c `**`run0 nh os`**` switch 'switch % --bypass-root-check'`

## Implementation Details
Each argument is separately matched by parsing the command-line so that:
- The arguments don't include the *Base Command*
- `run0` is stripped out (unless [degraded](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Degrade "Disable `run0` toleration"))
- Any flags are stripped out (unless [regarded](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Regard-Flags "Acknowledge flags in Initial Args"))
