set -l commands 'up down connect on off'

function wifi -a verb
    set -e argv[1]

    switch $verb
        case up down
            nmcli connection $verb $argv[1]
        case connect
            if test (count $argv) -gt 1
                nmcli device wifi connect $argv[1] password $argv[2]
            else
                nmcli device wifi connect $argv[1]
            end
        case on off
            nmcli radio wifi $verb
        case '*'
            nmcli device wifi list --rescan yes
    end
end

complete -c wifi -n "not __fish_seen_subcommand_from $commands" -fa "$commands"
complete -c wifi -n 'contains_seq up -- (commandline -op)' -xa '(nmcli -g NAME connection show)' -k
complete -c wifi -n 'contains_seq down -- (commandline -op)' -xa '(nmcli -g NAME connection show --active)' -k
complete -c wifi -n 'contains_seq connect -- (commandline -op)' -xa '(nmcli -g SSID device wifi list)' -k
