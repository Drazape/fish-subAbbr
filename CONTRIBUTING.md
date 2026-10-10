# Source Code
Contribution to the primary codebase doesn't have any special instructions.  
The [user documentation](https://drazape.github.io/fish-subAbbr/ "The documentation for both the users and distributors") is available to learn how to make and contributing packages

# Git Branching
The `develop` bookmark is used for the following purposes:
- Basing commits upon, downstream
- Pushing revisions to, upstream

# Nix Development Environment
The project uses [fish-nixenv](https://github.com/Drazape/fish-nixenv "GitHub Repository: Create Nix developments environments for Fish projects compatible with Direnv") for compatibility with Direnv.
> [!WARNING]
> The development environment does nothing without it being installed

# Documentation
Following are the guidelines for contributing to the documentation.
## Generation
The documentation site is generated via [Zensical](https://zensical.org/ "Official site: a modern static site generator designed to simplify building and maintaining project documentation")
## Style
We majorly follow the [Google Documentation Style Guidelines](https://developers.google.com/style "Editorial guidelines for writing clear and consistent technical documentation for an audience of software developers and other technical practitioners"), but with some deviations and project-exclusive guidelines.
### Deviations
We take some liberty to move away from the guidelines.  
The following sections describe the major deviations we made.
#### Curled Quotation
In contrast to the straight quotation marks used in the Google Style (`"`), we instead use curly quotation marks (`“` & `”`) outside code-blocks.
#### Line Breaks
The Google style prohibits the use of line breaks; consequently, starts of new lines is limited to a new paragraph.  
In contrast, we extensively use line breaks to make it easier for readers to skip sentences.
### Project Exclusive Guidelines
These are guidelines exclusive to this project, for they are not part of the common Google Style.
#### Word separation with non-breaking space
The following are guidelines for writing words separated with a non-breaking space (` `).
##### List
- `Base Command`
- `Initial Argument`
##### Rationale
Keep the following things in mind when writing the words in the word list:
|  Guideline | 👎 Examples of unrecommended strings |
| --------- | :------: |
| Do not hyphenate the two words | `Base-Command` `Initial-Argument` |
| Do not write the word in [PascalCase](https://wiki.c2.com/?PascalCase "c2 wiki page") | `BaseCommand` `InitialArgument` |
| Keep the both the words capitalized | `base command` `initial Argument` |
| The words should be separated with a non-breaking space (` `). The breaking space (` `) can cause the two words to be unexpectedly separated | `Base Command` `Initial Argument` |
