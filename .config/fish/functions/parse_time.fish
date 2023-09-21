function parse_time -a time
    if string match -rq '\A\d+s\z' $time
        set seconds (string match -r '\d+' $time)
    else if string match -rq '\A\d+m\z' $time
        set seconds (math "$(string match -r '\d+' $time) * 60")
    else if string match -rq '\A\d+h\z' $time
        set seconds (math "$(string match -r '\d+' $time) * 60 * 60")
    else
        echo 'arg must be an interval (e.g. 30s)'
        return 1
    end

    echo $seconds
end
