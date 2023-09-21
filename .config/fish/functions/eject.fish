function eject -a drive
    udisksctl unmount -b $drive
    and udisksctl power-off -b $drive
end
