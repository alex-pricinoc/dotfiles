function zst -a contents _destination
    set -l default_archive_name (echo $contents | trim_trailing_slash)'.tar.zst'
    set -l destination (default $_destination $default_archive_name)

    tar -c -- $contents | zstd >$destination
end
