---
title: Chain
comments: true
icon: lucide/square-stack
---

# Chain ^`chain`^
Convert short flags into their long variants, with additional support for chaining.

!!! caution "Use with Normal type"
    If both the normal variant, and this variant are used together, it must be done so wisely.  
    Mapping different flags to the same sub-commands at the same level could cause unexpected, though static behaviors.  
    Even so, the said behavior wouldn't change the meaning of the command, and would just leave out a few flags.

## Effect
Alone
:   If the short flag is encountered alone, then turn it into the long variant

Chained
: Until a mandatory short flag is encountered, the short flags are expanded to their long forms; once a mandatory short flag is encountered, the rest of the characters are used as the value for the Long flag.

## Arguments
Command-line tokens the wrapper accepts as arguments
### Positionals
1. **Initials**: The same as `sub-abbr`. Directly passed without any modification
2. **Short Flag**: The character after the `-`
3. **Long Flag**: The word after the `--`. Expands *Short Flag* into it

### Switches
Unlike the normal variant, only the necessary [*Base* switch](../../../../../Arguments/Sub-Commands/Add/Switches/Base.md){data-preview} is supported.
