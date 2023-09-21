status --is-interactive || exit

abbr - cd -
abbr .. cd ..
abbr ... cd ../../
abbr .... cd ../../../

abbr dt --position anywhere --set-cursor -- '~/Desktop/%'
abbr dc --position anywhere --set-cursor -- '~/Documents/%'
abbr dl --position anywhere --set-cursor -- '~/Downloads/%'

function _chpwd --on-variable PWD
    status --is-command-substitution || ls
end
