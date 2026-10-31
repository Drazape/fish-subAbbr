function _awabbre_internal_verify-arg_identifier-existance --description='Ensure existance of all identifiers in the sub-command arguments' --inherit-variable={identifiers,print}
    for identifier in {$argv}
        if ! contains -- {$identifier} {$identifiers}
            $print 'unknown abbreviation:' (format text bold (format text italics (format text color red {$identifier}))) >&2
            $print 'use the' (format url (_awabbre_internal_helpText-linker sub-command list) (format text italics 'List')' sub-command') 'to see all available abbreviations' >&2
            return 1
        end
    end
    return 0
end
