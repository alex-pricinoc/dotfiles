function backup
    set -l backup_files /home
    set -l destination (default $BACKUP /run/media/alex/T7 | trim_trailing_slash)
    set -l archive_file "$destination/$(hostname -s)-$(date +%Y-%m-%d).tar.gpg"

    test -e $destination
    or return 1

    echo "Backing up $backup_files to $archive_file"
    date
    echo

    begin
        tar -cv \
            --exclude $XDG_CACHE_HOME \
            --exclude $XDG_STATE_HOME \
            --exclude $XDG_TRASH_DIR \
            --exclude ~/Music \
            --exclude-vcs-ignores \
            --exclude-caches \
            -- $backup_files | gpg -c -z 0 >$archive_file
    end 2>/tmp/backup.log

    or return 1

    echo
    echo 'Backup finished'
    date

    fs $archive_file
end
