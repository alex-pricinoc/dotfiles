set -x XDG_CONFIG_HOME ~/.config
set -x XDG_DATA_HOME ~/.local/share
set -x XDG_STATE_HOME ~/.local/state
set -x XDG_CACHE_HOME ~/.cache
set -x XDG_BIN_HOME ~/.local/bin
set -x XDG_TRASH_DIR $XDG_DATA_HOME/Trash/files
set -x XDG_FONTS_DIR $XDG_DATA_HOME/fonts

set -x EDITOR hx
set -x GDK_DPI_SCALE 1.5
set -x QT_SCALE_FACTOR 1.5
set -x GNUPGHOME $XDG_DATA_HOME/gnupg
set -x GPG_TTY (tty)
set -x PASSWORD_STORE_DIR $XDG_DATA_HOME/pass
set -x RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/rg/ripgreprc


fish_add_path $XDG_BIN_HOME
