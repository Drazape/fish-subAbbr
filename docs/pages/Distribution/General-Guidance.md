---
comments: true
icon: lucide/landmark
---

# General Guidance
## Official Repository compatibility
To be compatible with the official repository helper, each package (a function) must do a job depending on the distribution of the package to be able to be enabled with `sub-abbrs` — the package repository helper/pkg-enabler. It is safer to meet both the requirements.

- [**Static**](https://fishshell.com/docs/4.7/tutorial.html#startup-where-s-bashrc "Official Fish documentation"){data-preview}[^static-function]: The function runs on the [events](https://fishshell.com/docs/4.6/language.html#event-handlers "automatically run when a specific event takes place"){data-preview}: `sub-abbr{s,_<commands>}`
- [**Dynamic**](https://fishshell.com/docs/4.7/tutorial.html#autoloading-functions "Official Fish documentation"){data-preview}[^dynamic-function]: The function name must have the format `_sub-abbr_pkg_<id>`, where `id` is what is given as an argument to `sub-abbrs`

## Multi-*Base Command* support
Packages should use the [*RegExp* switch](../Usage/Arguments/Sub-Commands/Add/Switches/Regular-Expression.md "Match *Sub-Command* with RegExp"){data-preview} whenever the same Sub-Command is being abbreviated more than once in the same *Base Command* (different [*Initial Args*](../Usage/Arguments/Positionals/Initial-Arguments.md "Args preceding Sub-Command"){data-preview}) so that users can create *Sub-Command* Abbreviations with multiple *Base Commands* easily, without having to parse RegExp themselves.

This is because you can not have more than one abbreviation for a *Sub-Command* & *Base Command* pair without using the *RegExp* switch. This is because `abbr` sets the identity of the internal abbreviation as that of the *Sub-Command* that is expanded, and there can only be one identity each for every abbreviation, and any attempt to create any more will result in overwriting of the older one. But since the *RegExp* flag allows us to have custom identities for the abbreviations, we can exploit it with the *Function* switch to create as many abbreviations for the same *Sub-Command* as we want. ([relevant Fish discussion](https://github.com/fish-shell/fish-shell/discussions/11682){data-preview})


[^static-function]: A function is distributed as statically distributed if it is part of the shell initialization configuration. Functions distributed as such are automatically loaded on the shell start-up; i.e. can be listed with `functions`
[^dynamic-function]: A function is dynamically distributed if it is distributed as a file in one of `$fish_function_path`; The file is sourced the first time the function is called
