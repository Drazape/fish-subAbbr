# Purpose
Simplify creating context-aware Sub-Command abbreviations [^simplification]

# Uses
## Defaults (convenience)
### Switches for certain subcommands  
```fish
sub-abbr add --degrade --set-cursor run0 nh os switch{,' % --bypass-root-check'}
```
<img width="1408" height="82" alt="run0-nh-os-switch" src="https://github.com/user-attachments/assets/a944f937-9803-4572-86d4-31b6eefd25e8" />

### A combination of switches
```fish
sub-abbr add -- eza --long{,\ --group}`
```
[^eza-why-group]  
<img width="965" height="82" alt="ls-group" src="https://github.com/user-attachments/assets/bda2680d-980f-4834-ba41-a9086aa3afad" />
## Clarity
### Turning short flags into long
#### `eza`: long flag
```fish
sub-abbr add -- eza -l --long
```
<img width="684" height="82" alt="ls-longopt" src="https://github.com/user-attachments/assets/97a9b831-2cb5-4f44-a245-6ff01b217e41" />

#### Jujutsu: *Sub-Command* aliases
```fish
sub-abbr add jj b{,ookmark}
sub-abbr add jj ci commit
```
<img width="702" height="86" alt="jj-subcommands" src="https://github.com/user-attachments/assets/af0e2f6a-1ce3-4f3f-b9c1-242bca0e9471" />

> [!TIP]
> Check the [packages](#Packages) for more complicated & useful abbreviations

---

# Usage

> [!TIP]
> ### Quick Start
> Add `sub-abbrs` to your Fish configuration and all official packages (included abbreviations) will automatically be loaded 

## `sub-abbr`

> [!TIP]
> See the detailed [documentation](https://drazape.github.io/fish-subAbbr/Usage/Arguments/Positionals/Expansion/ "GitHub Pages documentation on sub-abbr command usage")

Create personal Sub-Command abbreviations in the scope
### Arguments
#### Sub-Commands
##### Add
###### Positional
1. [**Initial Arguments**](https://drazape.github.io/fish-subAbbr/Usage/Arguments/Positionals/Initial-Arguments/ "documentation"): Precedes the *Sub-Command*. Becomes the new *Initial Arguments* for *Expansion*  
2. [**Sub-Command**](https://drazape.github.io/fish-subAbbr/Usage/Arguments/Positionals/Sub-Command/ "documentation"): The *Sub-Command* to be replaced (expanded) by the *Expansion*. Comes after the *Initial Arguments*
3. [**Expansion**](https://drazape.github.io/fish-subAbbr/Usage/Arguments/Positionals/Expansion/ "documentation"): The replacement (*Expansion*) of the typed *Sub-Command*. Becomes the new *Sub-Command* for the *Initial Arguments*
###### Switches
| Name | Description | Long | Short | Inherited [^inherited-switches] |
| :--: | ----------- | :--: | :---: | :-----------------------------: |
| [**Help**](https://drazape.github.io/fish-subAbbr/Usage/Arguments/Universal-Switches/Help/ "documentation") | Show a reference manual — consisting of the [purpose](#sub-abbr "The purpose of the command") & [arguments](#Arguments "Descriptions on all the supported arguments") | `help` | `h` | ❌ |
| [**Degrade**](https://drazape.github.io/fish-subAbbr/Usage/Arguments/Sub-Commands/Add/Switches/Degrade "documentation") | Disable toleration of `run0` as the command prefix; i.e., do not expand the *Sub-Command* if the *Initial Args* is prefixed with `run0` | `degrade` | `0` | ❌ |
| [**Regard Flags**](https://drazape.github.io/fish-subAbbr/Usage/Arguments/Sub-Commands/Add/Switches/Regard-Flags "documentation") | Acknowledge flags in the *Initial Arguments*; If not set, switches in the *Initial Arguments* are ignored | `regard-flags` | `s` | ❌ |
| [**RegExp**](https://drazape.github.io/fish-subAbbr/Usage/Arguments/Sub-Commands/Add/Switches/Regular-Expression "documentation") | Match *Sub-Command* with Regular Expressions. Essential (with `sub-command`) for abbreviating the same pair of *Sub-Command* & *Initial Arguments* [^multi-bases] | `regex` | `r` | ✅ |
| [**Set Cursor**](https://drazape.github.io/fish-subAbbr/Usage/Arguments/Sub-Commands/Add/Switches/Set-Cursor "documentation") | Set the cursor to a position. Same usage as the internal switch | `set-cursor` | `c` | ✅ | 
| [**Expander**](https://drazape.github.io/fish-subAbbr/Usage/Arguments/Sub-Commands/Add/Switches/Expander "documentation") | Use the output of a command as the *Expansion* | `function` | `f` | ✅ |
##### Identity
Manage context-aware sub-command abbreviation by their identities
###### Erase
Erase an abbr by its identity  
**Positionals**:
1. [**Initial Arguments**](https://drazape.github.io/fish-subAbbr/Usage/Arguments/Positionals/Initial-Arguments/ "wiki"): The *Initial Arguments* given to the abbreviation during creation
2. [**Sub-Command**](https://drazape.github.io/fish-subAbbr/Usage/Arguments/Positionals/Sub-Command/ "wiki"): The *Sub-Command* given to the abbreviation during creation
###### List
Get identities of loaded abbrs

## `sub-abbrs`
Helper to conveniently enable compatible packages
### Arguments
#### Positional
- **None**: When on arguments are specified, all the packages are activated
- **Command Names**: All the packages with support for the given commands are activated

> [!TIP]
> ### Discover Packages
>	- [Official](../functions/sub-abbr/pkg/)
>	- [3rd-party](https://github.com/topics/fish-subabbr)
> #### [Create](./CONTRIBUTING.md)
---

# Installation
## User
[**Fisher**](https://github.com/jorgebucaran/fisher "Fish plugin manager"): `fisher install Drazape/fish-subAbbr`

## System
```fish
curl -fsSL 'https://raw.githubusercontent.com/Drazape/fish-subAbbr/main/install.fish' | run0 fish -NP
```

> [!IMPORTANT]
> [More ways to install](https://drazape.github.io/fish-subAbbr/Installation/#package-manager "Distribution Package Managers")


[^simplification]: You can easily abbreviate base-commands, but there is no straight forward way to do the same with subcommands. After I finished developing this program, I found a GitHub [discussion](https://github.com/fish-shell/fish-shell/discussions/11682) & [Issue](https://github.com/fish-shell/fish-shell/issues/11944) in the Fish repository that comes up with this exact problem
[^eza-why-group]: Shows the group of the owned files. Default `long` switch in standard `ls` (I don't use this one, but you might want to if you see groups frequently. Why I am telling you this is that my aim is to set modern standards, not follow the legacy; as states my bio)
[^inherited-switches]: These are supported switches inherited from `abbr` that can also be used with `sub-abbr`. These switches may or may not be passed directly to `abbr` and could also contain enhancements.
[^multi-bases]: *RegExp* must be passed in order to use the same *Sub-Command* with the same *Base-Command* in a different position. For example, you can only have `jj l{,og}` and `jj op l{,og}` if *RegExp* is used. (You don't have to do anything extra, other than escape any regular expressions)
