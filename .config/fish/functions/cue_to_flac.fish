function cue_to_flac
    shnsplit -t "%n %p - %t" -f *.cue -o "flac flac -V --best -o %f -" *.{ape,flac,FLAC,wav}
    and cuetag.sh *.cue *.flac
end
