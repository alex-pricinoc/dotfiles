function usage --argument _dir
    set -l dir (default $_dir .)

    fs $dir/{.,}* 2>/dev/null | sort -h
end
