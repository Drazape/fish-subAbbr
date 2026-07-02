---
comments: true
icon: lucide/signpost
description: Distribution ways
---

# Methods
## Comparison
|  ~  | [Official Repository](#official-repository){data-preview} | [3rd-party](#3rd-party){data-preview} |
| :-: | :-----------------------------------------: | ---------------------- |
| **Distribution** | Via base package | Yourself. Users will have to install the package before using it. |
| **Configuration** | ❌ | Optional |
| **Updates** | Delayed for review | Direct |
| **Suffix** | Prohibited | Required |

???+ info "Function Name"
    To be indexed by the repository, your package's function name must be prefixed with `_sub-abbr_pkg_`.  
    [Groups](../Usage/Packages/Repository-Helper/Package-Tree.md){data-preview} are separated with a `_`; the group organisation is upto the developer, or the packager/distributor.
    ```fish {title="Format"}
    _sub-abbr_pkg_<groups(sep:_)>_<pkgname>
    ```

    If you want your [static](https://fishshell.com/docs/4.7/tutorial.html#startup-where-s-bashrc "Official Fish documentation"){data-preview}[^static-function] (non-[dynamic](https://fishshell.com/docs/4.7/tutorial.html#autoloading-functions "Official Fish documentation"){data-preview}[^dynamic-function]) package to be only activated when all the abbreviations are activated, you don't need to follow the prefix convention, and can simply choose to execute using the [event](https://fishshell.com/docs/4.6/language.html#event-handlers "automatically run when a specific event takes place"){data-preview}: `sub-abbrs`

## Methods
### Official Repository
Each package is a single function in the repository that provides abbreviations (regular and context-aware) for the specific command it corresponds to.  

!!! info "Official Root Group"
    The root group for the repository is `official`.

!!! tip "Gaze at Pre-existing Packages"
    Have a look at other packages defined in the [repository](https://github.com/Drazape/fish-subAbbr/tree/main/functions/sub-abbr/pkg/official/ "Official Package Repository"){data-preview} before pushing your own here.

!!! warning "Anti-legacy"
    Legacy software with modern alternatives won't be included in the official repository.  
    Tradition, familiarity with the legacy, inertia towards innovation—these won't be reasons accepted for “contributions.”  
    The ancients can build their own museum (legacy-stone repository).

!!! tip "Library"
    Use the [function library](../Usage/Packages/Software-Development-Kit/Expanders){data-preview} to create packages more easily using abstractions

### 3rd-party
3rd-party packages/repositories can use the program however they want. For example:

- Simple packages can directly distribute the abbreviations into shell initialization configuration. This way they don't need to be enabled after they have been installed (it was installed for the purpose of using it after all)
- Complex packages can ship their own commands and front-ends to configure the abbreviations and provide other features
- Packages may or may not choose to maintain compatibility with the official repository helper: `sub-abbrs`.
You might be able to get some creative inspiration by exploring existing packages/repositories, or you could also choose an unofficial repository if it suits your project better. 

!!! tip "Discovery"
    Make your 3rd-party project discoverable with the [topic](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/classifying-your-repository-with-topics#adding-topics-to-your-repository){data-preview}: [`fish-subabbr`](https://github.com/topics/fish-subabbr){data-preview}


[^static-function]: A function is distributed as statically distributed if it is part of the shell initialization configuration. Functions distributed as such are automatically loaded on the shell start-up; i.e. can be listed with `functions`
[^dynamic-function]: A function is dynamically distributed if it is distributed as a file in one of `$fish_function_path`; The file is sourced the first time the function is called
