function __ifuse_list_apps
    ifuse --list-apps | perl -ne '/^\"(?<id>.*?)\".*\"(?<desc>.*?)\"$/ and print "$+{id}\t$+{desc}\n"'
end

function ifuse_copy
    argparse 'a/app=' -- $argv
    or return

    if ! set -q _flag_a || test (count $argv) -lt 1
        echo 'Usage: ifuse_copy [-a|--app] FILE..'
        return 1
    end

    set -l mount (mktemp -d)

    ifuse --documents $_flag_a $mount
    and cpr $argv $mount

    umount $mount
end

complete -c ifuse_copy -s a -l app -x -a '(__ifuse_list_apps)'
