function default -a val default
    if test (count $argv) -gt 2
        list $argv[1..-2]
    else if test -n $val
        echo $val
    else
        echo $default
    end
end
