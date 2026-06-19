# Main Callables (visible)
(`sub-abbr{,s}`)
Functions called directly by the end-users

## `sub-abbr`
Create personal Sub-Command abbreviations in the scope
## `sub-abbrs`
Conveniently access Sub-Command abbreviation packages from the official repository


# hidden
(`sub-abbr/*`)
Hidden functions installed on the end-user's system.  

## Internal
(`internal/`)
Helper functions called by `sub-abbr`

## Packages
(`pkg/official/`)
Packages that users typically enable using `sub-abbrs` in their Fish shell-initialization configuration

> [!TIP]
> See the [Contribution Guide](../CONTRIBUTING.md#official-packages) to learn how to add more packages — correctly

## Library
Functions for creating [packages](#Packages)
