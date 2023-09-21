function eject -a drive -d "Safely eject a drive"
    if findmnt -S $drive >/dev/null
        udisksctl unmount -b $drive
    end
    or return

    udisksctl power-off -b $drive
    and echo "Powered off $drive."
end
