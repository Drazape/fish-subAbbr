set --local -- common_complete complete --command=sub-abbr --no-files
function single-switch --description='Only suggest the switch once' --inherit-variable=common_complete
    argparse --move-unknown s/short-option= l/long-option= -- {$argv}
    $common_complete --condition='! __fish_seen_argument --short='{$_flag_short_option}' --long='{$_flag_long_option} {$argv_opts} -- {$argv}
end

$common_complete
single-switch --short-option=h --long-option=help --description='Reference manuals' \
    --condition='set --local -- unbase (commandline --tokens-expanded --current-process --cut-at-cursor)[2..3]
                 test (count {$unbase}) -eq 0 && return 0
                 test "$unbase[1]" = add && return 0
                 test "$unbase[1]" = identity && test "$unbase[2]" != list && return 0
                 return 1'

set --local -- subcommand_complete {$common_complete} --condition='test (count (commandline -xpc)) -lt 2'
$subcommand_complete --arguments=add --description='Create abbrs'
$subcommand_complete --arguments=identity --description='Manage abbrs by their identities'

set --local -- identity_complete {$common_complete} \
    --condition='set --local -- unbase (commandline --tokens-expanded --current-process --cut-at-cursor)[2..3]
                test "$unbase[1]" = identity && ! contains "$unbase[2]" list erase'
$identity_complete --arguments=list --description='Get identities'
$identity_complete --arguments=erase --description='Erase abbrs with identity'
$common_complete \
    --condition='set --local -- subcommands (commandline --tokens-expanded --current-process --cut-at-cursor)[2..3]
                test "$subcommands[1]" = identity && test "$subcommands[2]" = erase' \
    --arguments='(sub-abbr identity list | string match --invert --regex -- (string escape --style=regex -- (commandline --tokens-expanded --current-process) | string join -- \|))'

set --local -- creation_condition --condition='test "$(commandline -xpc)[2]" = add'

set --local -- creation_complete single-switch {$creation_condition}
$creation_complete --short-option=c --long-option=set-cursor --description='Position the cursor at % post-expansion'
$creation_complete --short-option=0 --long-option=degrade --description='don\'t tolerate run0 prefix'
$creation_complete --short-option=s --long-option=regard-flags --description='Acknowledge flags in the Initial Command'
$creation_complete --short-option=e --long-option=expander --description='Use the output of a command as the Expansion'

set --local regex_complete {$common_complete} {$creation_condition} --short-option=r --long-option=regex
$regex_complete --description='Match command-line arguments with RegExp'
set --local -- regex_value {$regex_complete} --condition='string match --quiet --regex -- \'^(--regex=|-r)\w*$\' (commandline -xtc)'
$regex_value --arguments=sub-command --description='Match the sub-command with RegExp'
$regex_value --arguments=initials --description='Match Initial Arguments with RegExp'
