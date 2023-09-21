function pl -w 'pass show' -a account
    test -n "$account" || return 1

    set -l contents "$(pass show $account)"
    set -l password (echo $contents | head -n 1)
    set -l login (echo $contents | sed '2!d' | string split -f2 'login: ')

    wl-copy --paste-once --primary "$password"
    wl-copy --paste-once "$login"
end
