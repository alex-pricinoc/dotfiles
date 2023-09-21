function every
    if test (count $argv) -lt 2
        echo 'Usage: every <wait-time> <command> [optional arguments]'
        return 1
    end

    set seconds (parse_time $argv[1])

    if test $status -ne 0
        echo $seconds
        return 1
    end

    while true
        clear
        eval $argv[2..]
        sleep $seconds
    end
end
