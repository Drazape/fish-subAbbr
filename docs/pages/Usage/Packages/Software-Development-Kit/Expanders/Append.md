---
comments: true
title: Append
icon: lucide/arrow-big-right-dash
description: Append string instead of replacing it
---

# Append ^`append`^
Append a given string to the sub-command
## Argument: Positional
**String**
: The string that is appended after the sub-command

## Internal Operation
Since the last positional is always the sub-command, and the first positional is the string to replace with, the function simply returns two arguments it got with their positions swapped.
This means that the sub-command itself is kept alike on the command-line, and the first argument — the replacement string — is *appended* to the replacement string output.
