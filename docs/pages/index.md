---
comments: true
icon: lucide/house
---

# Home
## Description
This is an abstraction for Fish to create context-aware Sub-Command abbreviations

## Purpose
This is a 3rd-party solution to the problems:

- [Discussion](https://github.com/fish-shell/fish-shell/discussions/11682 "Discussion in the official Fish repository"){data-preview}
- [Issue](https://github.com/fish-shell/fish-shell/issues/11944 "Issue in the official Fish repository"){data-preview}

!!! note "Faced Myself"
    These discussions in the official Fish repository were discovered after the first pre-release of the program. That means, it is primarily the product of the personal problem being faced by the developer.

### Internal Built-in
Though the original `abbr` built-in is capable of creating all sorts of abbreviations, if we use the built-in methods without any complex custom functions and parsing of `commandline`, it leads to abbreviations that are

- Fired off even when the subcommand lies in unexpected positions
- Not fired off when used with `run0`
- Hard customization

### Individual solutions
The problem with this approach is that multiple repetitive functions are created, violating the [DRY principle](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself "Wikipedia: Don't Repeat Yourself"){data-preview}.
This leads to maintainability hell and difficulty & time-consumption in creating abbreviations. Any simple solutions lead to abbreviations that:

- [Fail on only Enter (not followed by space)](https://github.com/fish-shell/fish-shell/issues/11944#issuecomment-3478417297 "Fish issue"){data-preview}
- Not expanded when used with switches
- Require explicit handling of `run0`
- Are tedious to modify
- Harder to make complex expansions
- Are error-prone to matching
- Harder distribution

### Birth Aim
This program is designed to

- Tackle these issues
- Accessible creation of such abbreviations
- Remain customizable for complex abbreviations
- Management of such abbreviations
- Distribution of abbreviations (like completions) from multiple-sources, and the co-existence of each.
- Improving upon `builtin abbr`
	- If a *Sub-Command* was escaped once on the command-line, you don't have to do it again
  - The flags modifying the argument treatement don't modify the argument structure. (don't accept values if it is already setup to be provided as a positional otherwise)
