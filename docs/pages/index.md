---
comments: true
icon: lucide/house
description: Home Page
---

# Home
## Description
This is an abstraction for Fish to create context-aware Sub-Command abbreviations

## Purpose
This is a 3rd-party solution to the problems likewise faced by the developer:  
[Discussion](https://github.com/fish-shell/fish-shell/discussions/11682 "Discussion in the official Fish repository"){ data-preview .md-button .md-button--primary }
[Issue](https://github.com/fish-shell/fish-shell/issues/11944 "Issue in the official Fish repository"){ data-preview .md-button }

### Internal Built-in
Though the original `abbr` built-in is capable of creating all sorts of abbreviations, if we use the built-in methods without any complex custom functions and parsing of `commandline`, it leads to abbreviations that are:

- Fired off even when the sub-command lies in unexpected positions
- Not fired off when used with `run0`
- Hard to customize

### Individual solutions
The problem with this approach is that multiple repetitive functions are created, violating the [DRY principle](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself "Wikipedia: Don't Repeat Yourself"){data-preview}.
This leads to maintainability hell, along with difficulty, and increased time-consumption in creating abbreviations. Any simple solutions lead to abbreviations with the following inefficiencies:

- The generated abbreviations might [fire only on Enter (not spaces)](https://github.com/fish-shell/fish-shell/issues/11944#issuecomment-3478417297 "Fish issue"){data-preview}
- When not correctly handled, tokens might not expand when used with switches on the command-line.
- Unabstracted logic will be repeated to explicit handle `run0`
- The abbreviations can become quite tedious to modify
- Making complex expansions becomes harder
- Matching of the command-line with all the constraints and niche cases can be error-prone
- Because of the lengths of the scripts, these abbreviations can be harder to casually distribute on communication channels
- Because there will be so many incomplete bespoke implementations, collaboration on such abbreviations can quickly become an ordeal

### Aim
This program is designed carefully to tackle these issues; for that, it does the following:

- Makes creation of such abbreviations accessible by abstracting the complex boilerplate
- Remain customizable for complex abbreviations with the help of various switches
- Manage such abbreviations using helpers and abstracte identity databases
- Make distribution of such abbreviations (like completions) from multiple sources, and let them co-existence.
- Improve upon `builtin abbr`
	- Once the user escapes the *Sub-Command* in the current command, you don't have to escape it again
	- Unlike `builtin abbr`, the flags modifying the argument treatment don't modify the argument structure itself. (doesn't accept values if it is already setup to be provided as a positional)
