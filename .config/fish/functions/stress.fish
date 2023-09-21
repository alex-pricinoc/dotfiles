function stress -a device
    sudo sh -c "dd bs=32k <$device >/dev/null"
end

complete -r -c stress -a "(__fish_complete_blockdevice)"
