status --is-interactive || exit

abbr g -- git
abbr a -- aerc
abbr p -- pass
abbr pg -- pass git
abbr pl -- pass_login
abbr nd -- notify done
abbr copy -- fish_clipboard_copy
abbr paste -- fish_clipboard_paste
abbr df -- df -h
abbr disks -- lsblk
abbr cx -- chmod +x
abbr cme -- sudo chown -R $USER:$USER
abbr copy_writer -- ifuse_copy -a pro.writer
abbr like -- add_to_playlist -p liked
abbr tmp -- 'cd (mktemp -d)'
abbr m --set-cursor -- "math '%'"
abbr G --position anywhere --set-cursor -- '| rg %'
abbr L --position anywhere --set-cursor -- '| less %'

abbr yumi -- sudo yum install -y
abbr find --set-cursor -- 'yum provides "*/%"'
abbr deps -- yum repoquery --requires --resolve
abbr why -- yum repoquery --installed --whatrequires

abbr subl_config -- subl $XDG_CONFIG_HOME/sublime-text/Packages/User
