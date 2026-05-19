Contribution to the primary codebase doesn't have any special instructions. This is a guide on contributing packages.

[General Guidance](https://github.com/Drazape/fish-subAbbr/wiki/Distribution:-General-Guidance)

# Distribution
## Package Types
|  ~  | Official Repository | 3rd-party |
| :-: | :-----------------: | --------- |
| **Distribution** | Via base package | Yourself. Users will have to install the package before using it. |
| **Configuration** | ❌ | Optional |
| **Updates** | Delayed for review | Direct |
| **Suffix** [^func-suffix] | Prohibited | Required |

## Official Repository
Each package is a single function in the repository provides abbreviations for the specific command it corresponds to.
> [!TIP]
> Have a look at other packages defined in the repository before pushing your own here.
## 3rd-party
3rd-party packages/repositories can use the program however they want. For example:
- Simple packages can directly distribute the abbreviations into shell initialization configuration. This way they don't need to be enabled after they have been installed (it was installed for the purpose of using it afterall)
- Complex packages can ship their own commands and front-ends to configure the abbreviations and provide other features
- Packages may or may not choose to maintain compatibility with the official repository helper: `sub-abbrs`.
You might be able to get some creative inspiration by exploring existing packages/repositories, or you could also choose to an unofficial repository if it suits your project better. 

> [!TIP]
> Make your project discoverable with the [topic](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/classifying-your-repository-with-topics#adding-topics-to-your-repository): [`fish-subabbr`](https://github.com/topics/fish-subabbr)

[^func-suffix]: Each official repository compatible package is simply a function. The functions outside the official repository must have a unique suffix to avoid conflicts, while the official repository packages are prohibited to have one.
	- **Official**: `_sub-abbr_<command>`
	- **3rd-party**:
		- **Single-Command**: `_sub-abbr_<command>_<pkgname/purpose>`
		- **Multi-Command**: `_sub-abbr_<pkgname/purpose>`
