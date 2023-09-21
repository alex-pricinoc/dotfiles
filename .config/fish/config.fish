test -e ~/.extra.fish; and source ~/.extra.fish

if status --is-login
    exec sway &>/tmp/sway.log
end
