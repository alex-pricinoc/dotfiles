function sleep_then
    set seconds (parse_time $argv[1])

    if test $status -ne 0
        echo $seconds
        return 1
    end

    sleep $seconds
    eval $argv[2..]
end
