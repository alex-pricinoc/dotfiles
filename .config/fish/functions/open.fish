function open
    argparse -i q/quiet -- $argv
    or return

    if set -q _flag_q
        mimeopen $argv &>/dev/null & disown
    else
        mimeopen $argv
    end
end
