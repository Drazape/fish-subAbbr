---
comments: true
icon: lucide/check-check
description: Configure checking of the Base Command existence before adding
---

# Check Base Command
| Name | Values |
| :--: | :----: |
| `subabbr_nonexistent_basecommand` | `allow` `quiet` |

## Default
By default, fish-subAbbr checks if the Base Command we're adding the abbreviation for exists.  
If it doesn't, it fails and outputs an error message.

This is best for users who selectively enable their packages with only the commands they use, and also for package developers to avoid typos in the Base Command.

## Values
To change the [default][#default] behavior, you can set the `subabbr_nonexistent_basecommand` variable to one of the following values:

### Quiet
If the value of `subabbr_nonexistent_basecommand` is `quiet`, it will fail if the Base Command doesn't exist, but it will not output an error message.

This is useful for users who enable all their packages without manually filtering which commands they use.  
This setup automatically enables all the new packages that are added.

### Allow
If the value of `subabbr_nonexistent_basecommand` is set to `allow`, it will simply not check if the Base Command exists, and will add the abbreviation regardless.  
Also, there would obviously be no warning displayed.
