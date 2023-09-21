function add_to_playlist
    argparse 'p/playlist=' -- $argv
    or return

    if ! set -q _flag_p || test (count $argv) -lt 1
        echo 'Usage: add_to_playlist [-p|--playlist] SONG..'
        return 1
    end

    set -l playlist ~/Music/$_flag_p.m3u

    for song in $argv
        set -l song (realpath -z --relative-to ~/Music $song)

        grep -xsqF -- $song $playlist || echo $song >>$playlist
    end
end

set -l playlists (path basename ~/Music/*.m3u | path change-extension '' | string escape)

complete -c add_to_playlist -s p -l playlist -x -a "$playlists"
