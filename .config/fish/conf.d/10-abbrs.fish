status --is-interactive || exit

abbr o -- open -q
abbr @ -- swaymsg exec
abbr g -- git
abbr a -- aerc
abbr p -- pass
abbr pg -- pass git
abbr l -- less
abbr nd -- notify done
abbr df -- df -h
abbr nm -- nmcli
abbr disks -- lsblk
abbr msda -- mount /dev/sda
abbr esda -- eject /dev/sda
abbr cx -- chmod +x
abbr cme -- sudo chown -R $USER:$USER
abbr copy_writer -- ifuse_copy -a pro.writer
abbr tmp -- 'cd (mktemp -d)'
abbr charge -- 'sudo (which framework_tool) --charge-limit'
abbr G --position anywhere --set-cursor -- '| rg %'
abbr L --position anywhere --set-cursor -- '| less %'

abbr yumi -- sudo yum install -y
abbr find --set-cursor -- 'yum provides "*/%"'
abbr deps -- yum repoquery --requires --resolve
abbr why -- yum repoquery --installed --whatrequires

abbr st -- subl
abbr sp -- sublp
abbr sm -- smerge

abbr py -- python -q
