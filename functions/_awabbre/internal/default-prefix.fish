function _awabbre_internal_default-prefix --description='set default prefixes, if not already set'
    set --query -- awabbre_prefix || for prefix in run0 sudo doas
        type --query -- {$prefix} &&
            set --append --global -- awabbre_prefix {$prefix}
    end
end
