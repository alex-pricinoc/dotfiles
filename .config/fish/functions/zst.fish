function zst -a contents _destination
    set -l default_archive_name (echo $contents | _trim_trailing_slash)".tar.zst"
    set -l destination (_default $_destination $default_archive_name)

    tar -c -- $contents | zstd >$destination
end
