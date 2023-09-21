set -x NPM_HOME $XDG_DATA_HOME/npm
set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/config
set -x NPM_CONFIG_INIT_MODULE $NPM_CONFIG_USERCONFIG/npm-init.js
set -x NODE_REPL_HISTORY $XDG_STATE_HOME/node_repl_history

fish_add_path $NPM_HOME/bin
