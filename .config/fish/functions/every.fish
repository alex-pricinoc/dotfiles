function every
    if test (count $argv) -lt 2
        echo "Usage: every <wait-time> <command> [optional arguments]"
        return
    end

    while true
        clear
        eval $argv[2..-1]
        sleep $argv[1]
    end
end
