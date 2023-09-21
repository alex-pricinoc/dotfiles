status --is-interactive || exit

set -x FZF_DEFAULT_COMMAND 'rg --files --hidden'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_ALT_C_COMMAND 'fd --type d . --color=never'

set -x FZF_DEFAULT_OPTS
set -x -a FZF_DEFAULT_OPTS --layout=reverse
set -x -a FZF_DEFAULT_OPTS --inline-info
set -x -a FZF_DEFAULT_OPTS --color=light

function _fzf_compgen_path
    fd . $argv
end

function _fzf_compgen_dir
    fd --type d . $argv
end
