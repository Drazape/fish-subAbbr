---
status: index
comments: true
icon: lucide/toolbox
description: Library functions for building fish-awabbre packages.
---

# Software Development Kit
Abstractions officially provided to extend the functionality of fish-awabbre, and reduce boilerplate in packages.

## Library areas
| Area | Summary | Pages |
| ---- | ------- | ----- |
| [Expanders](Expanders/index.md){data-preview} | Convert an input into the replacement string at expansion time. | [Append](Expanders/Append.md){data-preview} |
| [Hooks](Hooks/index.md){data-preview} | Run plugin code when abbreviations are created, shown, or erased. | [Add](Hooks/Add.md){data-preview}, [Erase](Hooks/Erase.md){data-preview}, [Collect Info](Hooks/Collect-Info.md){data-preview}, [Gather Identifiers](Hooks/Gather-Identifiers.md){data-preview} |
| [Wrappers](Wrappers/index.md){data-preview} | Provide complete command-line frameworks around abbreviations. | [Flag](Wrappers/Flag/index.md){data-preview}: [Mandatory Long](Wrappers/Flag/Mandatory-Long.md){data-preview}, [To Long](Wrappers/Flag/To-Long/index.md){data-preview}, [Chain](Wrappers/Flag/To-Long/Chain.md){data-preview} |
