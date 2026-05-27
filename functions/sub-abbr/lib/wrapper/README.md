Library frameworks with independent arguments and working; abstractions over other commands.

# Usage
```fish
<WRAPPER> <args>
```

`<args>` depend on the wrapper

# Individual
## Flag
### `to-long`
Convert short flags into their long versions

#### Arguments
##### Positionals
1. **Initials**: The same as `sub-abbr`. Directly passed without any modification
2. **Short Flag**: The character after the `-`
3. **Long Flag**: The word after the `--`. Expands *Short Flag* into it

##### Switches
###### Un-inherited
- [RegExp: `sub-command`](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Regular-Expression "Match command-line arguments with RegExp")
- [Expander](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Expander "Use a command's output as the *Expansion*")
- [Set Cursor](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Set-Cursor "Position the cursor at `%`")
###### Exclusive
|    Name   |     Long    | Short | Value |               Description              |                                               Effect                                               |
| :-------: | :---------: | :---: | :---: | -------------------------------------- | -------------------------------------------------------------------------------------------------- |
| Mandatory | `mandatory` |  `m`  |  None | Makes it compulsory to provide a value | Puts the cursor with the long flag seperated with `=`; implies [`mandatory-long`](#mandatory-long) |

### `mandatory-long`
Enforce input for flags that require a value

#### Effect
If the flag token is left without a value (`=` sign), then it puts you back to the flag's token in front of the `=`

#### Positional
**Initials**: The same as `sub-abbr`. Directly passed without any modification
##### Switches
###### Un-inherited
- [RegExp: `sub-command`](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Regular-Expression "Match command-line arguments with RegExp")
- [Expander](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Expander "Use a command's output as the *Expansion*")
- [Set Cursor](https://github.com/Drazape/fish-subAbbr/wiki/Switch:-Set-Cursor "Position the cursor at `%`")

###### Exclusive
|    Name   |  Long  | Short |       Value        |             Description            |                Effect               |
| :-------: | :----: | :---: | :----------------: | ---------------------------------- | ----------------------------------- |
| Long Flag | `flag` |  `f`  | Required; variable | Mandatory long flags specification | Matches each of the specified flags |
