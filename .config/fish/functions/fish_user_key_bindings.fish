source /usr/share/fzf/shell/key-bindings.fish

# showkey -a
# fish_key_reader
function fish_user_key_bindings
    fzf_key_bindings

    bind \co execute
    bind \cd delete-char

    bind \f 'clear; commandline -f repaint'
end
