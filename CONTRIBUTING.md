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
## Generation
The documentation site is generated via [Zensical](https://zensical.org/ "Official site: a modern static site generator designed to simplify building and maintaining project documentation")
## Style
We majorly follow the [Google Documentation Style Guidelines](https://developers.google.com/style "Editorial guidelines for writing clear and consistent technical documentation for an audience of software developers and other technical practitioners"), but with some deviations and project-exclusive guidelines.
### Deviations
In contrast to the straight quotation marks used in the [Google Style](https://developers.google.com/style/quotation-marks "Google Documentation Style Guide: Quotation Marks document") (`"`), we instead use curly quotation marks (`“` & `”`) outside code-blocks.
### Project Exclusive Guidelines
#### Word: *Base Command*
Keep the following things in mind when writing *Base Command*:
- Do not hyphenate the two words (*Base-Command*)
- Do not write the word in [PascalCase](https://wiki.c2.com/?PascalCase "c2 wiki page")
- Keep both the words capitalized
- The words should be separated with a non-breaking space (` `). The breaking space (` `) can cause the two words to be unexpectedly separated
