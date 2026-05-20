# Purpose
Simplify creating context-aware Sub-Command abbreviations [^simplification]

# Uses
## Defaults (convenience)
### Switches for certain subcommands  
```fish
sub-abbr --degrade --set-cursor run0 nh os switch{,' % --bypass-root-check'}
```
<img width="1408" height="82" alt="run0-nh-os-switch" src="https://github.com/user-attachments/assets/a944f937-9803-4572-86d4-31b6eefd25e8" />

### A combination of switches
```fish
sub-abbr -- eza --long{,\ --group}`
```
[^eza-why-group]  
<img width="965" height="82" alt="ls-group" src="https://github.com/user-attachments/assets/bda2680d-980f-4834-ba41-a9086aa3afad" />
## Clarity
### Turning short flags into long
#### `eza`: long flag
```fish
sub-abbr -- eza -l --long
```
<img width="684" height="82" alt="ls-longopt" src="https://github.com/user-attachments/assets/97a9b831-2cb5-4f44-a245-6ff01b217e41" />

#### Jujutsu: *Sub-Command* aliases
```fish
subabbr jj b{,ookmark}
subabbr jj ci commit
```
<img width="702" height="86" alt="jj-subcommands" src="https://github.com/user-attachments/assets/af0e2f6a-1ce3-4f3f-b9c1-242bca0e9471" />

---

# Usage
## `sub-abbr`
Create personal Sub-Command abbreviations in the scope
### Arguments
#### Positional
1. **Initial Arguments**: precedes the *Sub-Command*. Becomes the new *Initial Arguments* for *Expansion*  
2. **Sub-Command**: The *Sub-Command* to be replaced (expanded) by the *Expansion*. Comes after the *Initial Arguments*
3. **Expansion**: The replacement (*Expansion*) of the typed *Sub-Command*. Becomes the new *Sub-Command* for the *Initial Arguments*
#### Switches
| Name | Description | Long | Short | Inherited [^inherited-switches] |
| :--: | ----------- | :--: | :---: | :-----------------------------: |
| **Help** | Show a reference manual — consisting of the [purpose](#sub-abbr "The purpose of the command") & [arguments](#Arguments "Descriptions on all the supported arguments") | `help` | `h` | ❌ |
| **Degrade** | Disable toleration of `run0` as the command prefix; i.e., do not expand the *Sub-Command* if the *Initial Args* is prefixed with `run0` | `degrade` | `0` | ❌ |
| **Regard Flags** | Acknowledge flags in the *Initial Arguments*; If not set, switches in the *Initial Arguments* are ignored | `regard-flags` | `s` | ❌ |
| **RegExp** | Match *Sub-Command* with Regular Expressions. Essential for abbreviating the same pair of *Sub-Command* & *Initial Arguments* [^multi-bases] | `regex` | `r` | ✅ |
| **Set Cursor** | Set the cursor to a position. Same usage as the internal switch | `set-cursor` | `c` | ✅ | 
| **Function** | Use the output of a command as the *Expansion* | `function` | `f` | ✅ |

## `sub-abbrs`
Helper to conveniently enable compatible packages
### Arguments
#### Positional
**None**: When on arguments are specified, all the packages are activated
**Command Names**: All the packages with support for the given commands are activated

> [!TIP]
> ### Packages
> - Discover
>	- [Official](./functions/)
>	- [3rd-party](https://github.com/topics/fish-subabbr)
> - [Create](./CONTRIBUTING.md)
---

# Installation
## User
[**Fisher**](https://github.com/jorgebucaran/fisher "Fish plugin manager"): `fisher install Drazape/fish-subAbbr`

## System
```fish
curl -fsSL 'https://raw.githubusercontent.com/Drazape/fish-subAbbr/main/install.fish' | run0 fish -NP
```

> [!IMPORTANT]
> [More ways to install](https://github.com/Drazape/fish-subAbbr/wiki/Installation#Package-Manager "Distribution Package Managers")


[^simplification]: You can easily abbreviate base-commands, but there is no straight forward way to do the same with subcommands. After I finished developing this program, I found a [GitHub discussion that comes up with this exact problem](https://github.com/fish-shell/fish-shell/discussions/11682)
[^eza-why-group]: Shows the group of the owned files. Default `long` switch in standard `ls` (I don't use this one, but you might want to if you see groups frequently. Why I am telling you this is that my aim is to set modern standards, not follow the legacy; as states my bio)
[^inherited-switches]: These are supported switches inherit from `abbr` that are not already being internally used, and thus can be passed to `sub-abbr`, which it passes directly to `abbr`
[^multi-bases]: *RegExp* must be passed in order to use the same *Sub-Command* with the same *Base-Command* in a different position. For example, you can only have `jj l{,og}` and `jj op l{,og}` if *RegExp* is used. (You don't have to do anything extra, other than escape any regular expressions)
