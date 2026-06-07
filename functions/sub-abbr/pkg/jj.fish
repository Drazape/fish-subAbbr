begin
    set --local -- exec_name jj
    set --local -- exec_section _{$exec_name}
    function _sub-abbr_pkg{$exec_section} --description='context-aware expansions for Jujutsu' --on-event=sub-abbr{s,$exec_section} --inherit-variable=exec_name
        begin # sub-commands
            set --local -- sub_abbr sub-abbr add {$exec_name} --
            $sub_abbr b{,ookmark}
            $sub_abbr c{i,ommit}
            $sub_abbr desc{,ribe}
            $sub_abbr st{,atus}
            $sub_abbr op{,eration}
        end

        begin # switches
            begin # short → long
                set --local -- long_flag _sub-abbr_lib_wrapper_flag_to-long {$exec_name}

                # global (universal)
                $long_flag --mandatory -- R repository
                begin
                    set --local -- help_flags h help
                    $long_flag -- {$help_flags}
                    begin
                        set --local -- subcommand $long_flag --regex=initials -- .\*
                        $subcommand {$help_flags}
                        $subcommand .\* {$help_flags}
                    end
                end
                $long_flag V version

                # sub-commands exclusive
                begin # common switches
                    set --local -- common $long_flag --regex=initials
                    begin # targets
                        set --local -- target {$common} --mandatory --

                        $target 'absorb|diff|diffedit|interdiff|restore|squash' f{,rom}
                        $target 'fix|rebase|simplify-parents' s{,ource}
                        $target 'diffedit|log|rebase|resolve|revert|sign|simplify-parents|split|squash|unsign' r{,evision}
                        $target 'diff|evolog' r{,evisions}

                        $target 'absorb|restore|squash' t into
                        $target 'diff|diffedit|interdiff' t{,o}
                        $target 'duplicate|rebase|revert|split|squash' o{,nto}
                        $target 'evolog|log' n limit
                        $target 'evolog|log' T template

                        $target 'commit|describe|metaedit|new|split|squash' m{,essage}

                        set --local -- before_and_after 'duplicate|new|rebase|revert|split|squash'
                        $target {$before_and_after} A after
                        $target {$before_and_after} B before

                        begin # Bookmark
                            set --local -- bookmark {$long_flag} --mandatory bookmark
                            $bookmark --regex=initials -- 'advance|move' t{,o}
                            $bookmark --regex=initials -- 'create|list|set' r{,evision}
                            $bookmark -- move f{,rom}
                        end
                        begin # Operation
                            set --local operation {$long_flag} operation
                            $operation --mandatory --regex=initials -- 'log|show' T template
                            $operation --regex=initials -- 'diff|log|show' G no-graph
                            $operation --regex=initials -- 'diff|log|show' p{,atch}
                            $operation --regex=initials -- 'diff|log|show' s{,ummary}
                            $operation --mandatory -- diff f{,rom}
                            $operation --mandatory -- diff t{,o}
                            $operation --mandatory -- diff o{,peration}
                            $operation --mandatory -- log n limit
                            $operation -- log d op-diff
                        end
                        begin # Git
                            set --local git {$long_flag} --mandatory git
                            $git --regex=initials -- 'clone|fetch' b{,ranch}
                            begin
                                set --local -- push {$git} -- push
                                $push b{,ookmark}
                                $push r{,evision}
                                $push c{,hange}
                                $push o{,ption}
                            end
                        end
                    end
                    begin # File
                        set --local -- file {$long_flag} -- file
                        $file --regex=initials -- 'annotate|chmod|list|search|show' r{,evision}
                        $file --regex=initials -- 'annotate|list|show' T template
                        $file -- search p{,atten}
                    end
                    $common -- 'commit|restore|split|squash' i{,nteractive}
                    $common -- 'next|prev' e{,dit}
                    $common -- 'next|prev' n{,o-edit}
                    $common -- 'evolog|log' G no-graph
                    $common -- 'evolog|log' p{,atch}
                    $common -- 'evolog|log' s{,ummary}
                end

                # single sub-command exclusive
                $long_flag --mandatory -- restore c{,hances-in}
                $long_flag --mandatory -- rebase b{,ranch}
                $long_flag --mandatory -- help k{,eyword}
                $long_flag -- squash u{,se-destination-message}
                $long_flag -- squash k{,eep-emptied}
                $long_flag -- fix a{,ll-lines}
                $long_flag -- resolve l{,ist}
                $long_flag -- split p{,arallel}
                $long_flag -- bisect run r{,ange}
            end
        end
        begin # mandate values
            set --local -- mandate _sub-abbr_lib_wrapper_flag_mandatory-long jj
            $mandate --flag={at-operation,color,config{,-file}}
            $mandate --flag=key -- sign
            $mandate --regex=initials --flag=tool -- 'commit|diffedit|resolve|restore|split'
            $mandate --regex=initials --flag=remote -- bookmark 'list|track|untrack'
            begin # Git
                set --local -- git {$mandate} git
                $git --regex=initials --flag=remote -- 'clone|fetch|push'
                $git --flag={depth,fetch-tags} -- clone
                $git --flag=git-repo -- init
                begin # Remote
                    set --local -- remote {$git} remote
                    $remote --flag={fetch-tags,push-url} -- add
                    $remote --flag={push,fetch} -- set-url
                end
            end
        end
    end
end
