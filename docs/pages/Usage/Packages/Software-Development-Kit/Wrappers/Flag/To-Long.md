---
title: To Long
comments: true
icon: lucide/arrow-right-from-line
description: Convert flags to long
---

# To Long ^`to-long`^
Convert short flags into their long versions

## Benefits
- **Visual Feedback**: The user is instantly informed if the flag they entered is the correct one.
- **Flag Funcionality**: Glancing back, one might not be able to instantly recall the short flag they typed out of muscle memory. The long flag variant the short flag expanded into can provide more information on the flag, while still working as usual.

## Arguments
### Positionals
1. **Initials**: The same as `sub-abbr`. Directly passed without any modification
2. **Short Flag**: The character after the `-`
3. **Long Flag**: The word after the `--`. Expands *Short Flag* into it

### Switches
#### Un-inherited
- [RegExp: `sub-command`](../../../../Arguments/Sub-Commands/Add/Switches/Regular-Expression.md "Match command-line arguments with RegExp"){data-preview}
- [Expander](../../../../Arguments/Sub-Commands/Add/Switches/Expander.md "Use a command's output as the *Expansion*"){data-preview}
- [Set Cursor](../../../../Arguments/Sub-Commands/Add/Switches/Set-Cursor.md "Position the cursor at `%`"){data-preview}

#### Exclusive
|    Name   |     Long    | Short | Value |               Description              |                                               Effect                                               |
| :-------: | :---------: | :---: | :---: | -------------------------------------- | -------------------------------------------------------------------------------------------------- |
| Mandatory | `mandatory` |  `m`  |  None | Makes it compulsory to provide a value | Puts the cursor with the long flag separated with `=`; implies [`Mandatory Long`](./Mandatory-Long.md){data-preview} |
