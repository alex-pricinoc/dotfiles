function cue_to_flac
    shnsplit -t "%n %p - %t" -f *.cue -o "flac flac -V --best -o %f -" *.{ape,flac}
    cuetag.sh *.cue *.flac
end

function flac_to_opus
    fd -e flac -x ffmpeg -i {} -c:a libopus -b:a 192k -ac 2 -loglevel quiet -stats {.}.opus
end

function chapters -d "Split audiobook into chapters"
    set -l in $argv

    ffmpeg -i "$in" (ffprobe -i "$in" -show_chapters -print_format json | jq -r '[.chapters[] | "-c copy -ss " + .start_time + " -to " + .end_time + " " + (.tags.title + ".m4b" | gsub(" "; "_"))] | join(" ")' | string split " ")
end

function yta
    yt-dlp -x --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s' $argv
end

function graph
    graph-easy --as=boxart --timeout=30 $argv
end

function empty_trash
    rm -rf $XDG_TRASH_DIR/{.,}*
end
