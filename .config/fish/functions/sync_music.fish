function sync_music
    set -l mount (mktemp -d)

    ifuse --documents com.foobar2000.mobile $mount

    and cpr --delete \
        --include='*/' \
        --include='*.m3u8' \
        --include='*.opus' \
        --exclude='*' \
        ~/Music $mount

    and umount $mount
end
