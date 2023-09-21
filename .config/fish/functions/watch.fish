function watch
    set -l command $argv[-1]
    set -l source (default $argv[1..-2] .)

    inotifywait -qm --event close_write --format '%w' $source | while read -l file
        clear
        eval $command
    end
end
