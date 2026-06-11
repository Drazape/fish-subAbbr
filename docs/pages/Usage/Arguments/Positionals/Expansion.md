---
comments: true
description: The string that replaces the *Sub-Command* on match
---

# Expansion
The string that replaces the *Sub-Command* on match

## Properties
| Position | Presence |
| :------: | :------: |
|   `-1`   | Required |

## Details
- **Relation with other positionals**
	- **Argument Position**: followed by the *Sub-Command*; the last positional
	- **Command-line**: Replaces *Sub-Command* 
- **Tokens**
	- **Argument Passing**: Passed as a single token
	- **Command-line**: Can comprise of multiple tokens (by including spaces; it replaces the *Sub-Command* as a literal string, not a token)
### Customizable Behavior
- [⚙️](../Sub-Commands/Add/Switches/Set-Cursor.md "Position the cursor at `%`"){data-preview} **End of command-line**: The cursor is placed after the ` ` suffix added to the *Expansion*
- [⚙️](../Sub-Commands/Add/Switches/Expander.md "Use a command's output as the *Expansion*"){data-preview} **Static String**: The *Expansion* is a static string that doesn't change.

## Usage
```fish {title="format"}
sub-abbr <initial-arguments> <Sub-Command> <EXPANSION>
```

### Examples
> [!NOTE]
> The *Expansion*s are indicated in **Bold**

- `sub-abbr jj ci `**`commit`**
- `sub-abbr -0c run0 nh os switch `**`'switch % --bypass-root-check'`**
