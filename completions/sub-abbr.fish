set --local -- common_complete complete --command=sub-abbr --no-files

$common_complete
$common_complete --short-option=h --long-option=help --description=Help
$common_complete --short-option=c --long-option=set-cursor --description='Position the cursor at % post-expansion'
$common_complete --short-option=0 --long-option=degrade --description='don\'t tolerate run0 prefix'
$common_complete --short-option=s --long-option=regard-flags --description='Acknowledge flags in the Initial Command'
$common_complete --short-option=f --long-option=function --description='Use the output of a command as the Expansion'
