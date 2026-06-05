---
comments: true
---

# Degrade
Disable `run0` command-prefix toleration

## Properties
| Value | Short |    Long   | Sub-Command | Inherited |
| :---: | :---: | :-------: | :---------: | :-------: |
|  None |  `0`  | `degrade` |     Add     |     ❌    |

## Details
- **Relation**: [*Initial Arguments*](../../../Positionals/Initial-Arguments.md "Args preceding *Sub-Command*"){data-preview}: prepended `run0` would no longer be specially accepted
- **Use-case**: For abbreviating commands that must be elevated for the expansion to occur

## Usage
```fish {title="format"}
sub-abbr add … <DEGRADE FLAG> (?:`--`) …
```

### Examples
#### abbreviating `run0`
Always use `--empower` so that the created files are owned by the calling user, not `root`
```fish {title="command"}
sub-abbr add -0s run0 {,--empower\ }touch
```

#### Expanding only with `run0`
Only bypass *root check* on an attempt to run as `root`
```fish {title="command"}}
sub-abbr add -0c run0 nh os switch{,' % --bypass-root-check'}
```
