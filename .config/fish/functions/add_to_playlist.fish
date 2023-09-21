function add_to_playlist
    argparse 'p/playlist=' -- $argv
    or return

    if ! set -q _flag_p || test (count $argv) -lt 1
        echo "Usage: add_to_playlist [-p|--playlist] SONG.."
        return
    end

    set -l playlist ~/Music/$_flag_p.m3u8

    test -e $playlist || echo "#EXTM3U" >$playlist

    for song in $argv
        set -l song (realpath -z --relative-to ~/Music $song)

        echo "Adding $song to $playlist"

        echo $song >>$playlist
    end
end

set -l playlists (path basename ~/Music/*.m3u8 | path change-extension '' | string escape)

complete -c add_to_playlist -s p -l playlist -x -a "$playlists"
