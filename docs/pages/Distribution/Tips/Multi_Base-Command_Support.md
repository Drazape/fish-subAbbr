---
comments: true
icon: lucide/landmark
description: Multiple Base-Command permutations
---

# Multi *Base-Command* support
Packages should use the [*RegExp* switch](../../Usage/Arguments/Sub-Commands/Add/Switches/Regular-Expression.md "Match *Sub-Command* with RegExp"){data-preview} whenever the same *Sub-Command* is being abbreviated more than once in the same *Base Command* (different [*Initial Args*](../../Usage/Arguments/Positionals/Initial-Arguments.md "Args preceding Sub-Command"){data-preview}) so that users can create *Sub-Command* Abbreviations with multiple *Base Commands* easily, without having to parse RegExp themselves.

This is because you can not have more than one abbreviation for a *Sub-Command* & *Base Command* pair without using the *RegExp* switch. This is because `abbr` sets the identity of the internal abbreviation as that of the *Sub-Command* that is expanded, and there can only be one identity each for every abbreviation, and any attempt to create any more will result in overwriting of the older one. But since the *RegExp* flag allows us to have custom identities for the abbreviations, we can exploit it with the *Function* switch to create as many abbreviations for the same *Sub-Command* as we want.
[relevant Fish discussion](https://github.com/fish-shell/fish-shell/discussions/11682){ data-preview .md-button .md-button--primary }
