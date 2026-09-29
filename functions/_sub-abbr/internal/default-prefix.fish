function _sub-abbr_internal_default-prefix --description='set default prefixes, if not already set'
    set --query -- subabbr_prefix || for prefix in run0 sudo doas
        type --query -- {$prefix} &&
            set --append --global -- subabbr_prefix {$prefix}
    end
end
