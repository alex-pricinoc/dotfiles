function fish_prompt
    set_color $fish_color_cwd
    echo -n (basename $PWD)
    set_color normal
    echo -n -s (fish_vcs_prompt) ' '
end
