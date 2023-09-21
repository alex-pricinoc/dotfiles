source ~/.extra.fish

alias e $EDITOR
alias E sudoedit
alias dot "git --work-tree=$HOME --git-dir=$HOME/.dotfiles"

if status --is-login
    exec sway &>/tmp/sway.log
end
