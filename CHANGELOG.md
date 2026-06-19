# [Unreleased] - Title
<!-- New changes here  -->



# [v0.6.0] - Repository: package groups
## Breaking: Repository
The repository helper now manages the repository via package groups in addition to packages. The `sub-abbrs` command is completely backward incompatible (except for no arguments)

Instead of the multiple package identifier, it now accepts only a package path, which may be a package group or a package itself.  
~This means that you can no longer activate multiple packages.~ Well… you actually can — with [package groups](https://drazape.github.io/fish-subAbbr/Usage/Packages/Repository-Helper/Package-Tree "GitHub Pages documentation: the new tree structure")! It's just not manual anymore.
> [!TIP]
> See the new [documentation](https://drazape.github.io/fish-subAbbr/Usage/Packages/Repository-Helper/Package-Tree/ "GitHub Pages documentation: new repository helper: sub-abbrs") added
## Meta
### Workflows
- **Release notes as code**: Automatically generate release release-notes using CHANGELOG.md
### Readme
- Link `sub-abbr` *Usage* to the GitHub pages documentation
- Fix missing bullets in the Usage section of `sub-abbrs`
- Add a "Quick Start" tip to the Usage section. Useful when the user doesn't want to read the overview, i.e., when they just want to use the existing packages without learning how to use the program.
### Docs
- **Discard tip**: Add tip about abbreviation discard simulation based on conditions to Expander


# [v0.5.4] - exec handling; completion enhancements; SDK docs
## Feature
**Ignore `exec` prefix**: Abbreviations now automatically ignore `exec` when it is prefixed to the command for omitting `fork()`. It will behave as if `exec` was never present.

## Completions
1. **Readable Completions**: Conditions now use multiple-lines, allowing for use of long-texts. The *Scope* change (3) introduces indentation
2. **`sub-abbrs` support**: Completions for `sub-abbrs` — the repository package helper, has been added
3. **Scope** Variables are now scoped to only where needed, and used. This allows for less error-prone code, and avoid scattering

## Documentation
**SDK Migration**: The SDK is now also documented using Zensical on GitHub pages. This allows seemless linking to pages in the documentation.


# [v0.5.3] - respect Help switch on sub-commands
This is a small release with an important **convenience fix**. The functioning is still exactly the same

## Fix
The bug where the *Help* switch would be interpreted as a positional argument is fixed

## Refactor
Instead of matching sub-commands using `if`/`else`, use `switch`


# [v0.5.2] - Zensical documentation

## Media
1. The documentation was migrated from GitHub Wiki to Zensical
2. The Readme now correctly uses the sub-commands

## Fixes
### Package
**Jujutsu**: Require value for all `git push` commands

### Fisher
Fix dependency name

## Refactor
For `sub-abbr` sub-command matching, use `switch` instead of multiple `if`/`else` statements


# [v0.5.1] - misc enhancements & fixes

## Fixes
- Elevated commands now check if the base-command matches.
- Updated function names for packages
- Help: explicit success error codes

## Enhancements
- re-added Fisher support
- Many additions to the Jujutsu package
- More documentation for library


# [v0.5.0] - expander; regex val fix; lib

## Breaking Change
**Rename Switch**: *Function* → *Expander*

## Fix
*RegExp* switch not accepting *sub-command* as one of the values.

## New
Library for creating new abbreviations


# [v0.4.2] - Edit regexes, drop Fisher

## Features (non-breaking)
- **Initial Argument regexes**: Initial Arguments can now also be matched with regexes. (find info on the wiki)
### Completion enhancements (identity)
- Do not suggest the Help flag with `list`
- Suggest abbreviation identities with `erase`

## Changes
- **Identity**: List: Reject all arguments
- **Error Outputs**: Use background colors for literals
- **Functions Grouping**: Functions are organised in `functions/` by their type. (breaks *Fisher* compatibility) (See the wiki for updated Nix configuration; you won't need to do this after the package)

## Fixes
- Fix sub-command being ignored without *Regard Flags* if a flag
### Minor
- Fixes argument checks in certain situations
- Pipe error messages to `STDERR`

## Refactoring
Code in the expander was re-arranged


# [v0.4.1] - arg count verification fix & performance improvements

## Fixes
**argument counting**: Showing succeeded number than actual requirement. Allowing pre-decesced number of argument.

## Performance Improvements
Removed obsolete loop


# [v0.4.0] - identity subcommands, undepend:systemd, …

## Breaking
- **Sub-Commands**: `sub-abbr` now uses sub-commands for management. New *Identity* management commands are added.

## Packaging Changes
- **systemd independence**: `sub-abbr` is no longer dependent on systemd. (now cross-platform)

## Internal improvements
- **Non-generic functions**: Helper functions are now prefixed with `sub-abbr_`
- **Cleaner Environment**: Variables are used instead of aliases

## Repository Packages
**nh**: The cursor is now placed at the end (no longer uses `--set-cursor`)

## External
The wiki has been completed


# [v0.3.0] - Switch reworks: degrade, function 

## Switch Reworks
- **Rename Flag**: long: `norun0` → `degrade`: This would allow for easier change in elevation trends
- **New Switch** (inherited): *Functions*: Allow the expansions to be dynamically decided with commands

## Fixes
- Fixed mistyped dynamic function names (visual; doesn't affect functioning)
- Repetitive function definition: helper functions are defined outside in separate files to avoid repetitive definitions
- Various refactoring & clean-ups

## External: wiki
A work-in-progress documentation for distributors and users/developers of the program


# [v0.2.1] - (bug) fix flag parsing

- **Set Cursor**: Now only set when actually given; so you can use `%` in the arguments when not explicitly provided
- **Value-less flags**: Previously, distinct flags couldn't co-exist between different abbreviations, and the first run of `sub-abbr` would determine the permanent value of the switches. This has now been fixed so you can create any combination of switches and arguments.


# [v0.2.0] - multiple initial args 

- Improvements to output formatting
- Parse initial arguments into multiple arguments


# [v0.1.0] - Basic Features 

The initial release.
Includes:
- Core Functionality (basic match comparison)
- Basic Features and customization
- Barebones repository and repository helper
