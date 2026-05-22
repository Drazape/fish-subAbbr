set --local -- common_complete complete --command=sub-abbr --no-files

$common_complete
$common_complete --short-option=h --long-option=help --description=Help

set --local -- subcommand_complete {$common_complete} --condition='test (count (commandline -xpc)) -lt 2'
$subcommand_complete --arguments=add --description='Create abbrs'
$subcommand_complete --arguments=identity --description='Manage abbrs by their identities'

set --local -- identity_complete {$common_complete} --condition='test "$(commandline -xpc)[2]" = identity && ! contains "$(commandline -xpc)[3]" list erase'
$identity_complete --arguments=list --description='Get identities'
$identity_complete --arguments=erase --description='Erase abbrs with identity'

set --local -- creation_complete $common_complete --condition='test "$(commandline -xpc)[2]" = add'
$creation_complete --short-option=c --long-option=set-cursor --description='Position the cursor at % post-expansion'
$creation_complete --short-option=0 --long-option=degrade --description='don\'t tolerate run0 prefix'
$creation_complete --short-option=s --long-option=regard-flags --description='Acknowledge flags in the Initial Command'
$creation_complete --short-option=f --long-option=function --description='Use the output of a command as the Expansion'
