---
comments: true
icon: lucide/signpost
---

# Methods
## Comparison
|  ~  | [Official Repository](#official-repository){data-preview} | [3rd-party](#3rd-party){data-preview} |
| :-: | :-----------------------------------------: | ---------------------- |
| **Distribution** | Via base package | Yourself. Users will have to install the package before using it. |
| **Configuration** | ❌ | Optional |
| **Updates** | Delayed for review | Direct |
| **Suffix** | Prohibited | Required |

???+ note "Prefixes"
    Each official repository-compatible package is simply a function. The functions outside the official repository must have a unique suffix to avoid conflicts, while the official repository packages are prohibited from having one.
    - **Official**: `_sub-abbr_pkg_<command>`
    - **3rd-party**:
    	- **Single-Command**: `_sub-abbr_pkg_<command>_<pkgname/purpose>`
    	- **Multi-Command**: `_sub-abbr_pkg_<pkgname/purpose>`

## Methods
### Official Repository
Each package is a single function in the repository that provides abbreviations (regular and context-aware) for the specific command it corresponds to.
!!! tip "Gaze at Pre-existing Packages"
    Have a look at other packages defined in the repository before pushing your own here.

!!! warning "Anti-legacy"
    Legacy software with modern alternatives won't be included in the official repository.  
    Tradition, familiarity with the legacy, inertia towards innovation—these won't be reasons accepted for "contributions."  
    The ancients can build their own museum (legacy-stone repository).

!!! tip "Library"
    Use the [function library](https://github.com/Drazape/fish-subAbbr/tree/main/functions/sub-abbr/lib/){data-preview} to create packages more easily using abstractions

### 3rd-party
3rd-party packages/repositories can use the program however they want. For example:
- Simple packages can directly distribute the abbreviations into shell initialization configuration. This way they don't need to be enabled after they have been installed (it was installed for the purpose of using it after all)
- Complex packages can ship their own commands and front-ends to configure the abbreviations and provide other features
- Packages may or may not choose to maintain compatibility with the official repository helper: `sub-abbrs`.
You might be able to get some creative inspiration by exploring existing packages/repositories, or you could also choose an unofficial repository if it suits your project better. 

!!! tip "Discovery"
    Make your 3rd-party project discoverable with the [topic](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/classifying-your-repository-with-topics#adding-topics-to-your-repository){data-preview}: [`fish-subabbr`](https://github.com/topics/fish-subabbr){data-preview}
