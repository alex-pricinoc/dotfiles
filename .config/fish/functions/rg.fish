function rg
    # output to terminal
    if isatty stdout
        set -l opts --pretty --context=2

        # pipe
        not isatty stdin; and set -a opts --context=0 --no-line-number

        command rg $opts $argv | less
    else
        # output to file
        set -l opts --no-filename

        command rg $opts $argv
    end
end
