set PROJECT_PATHS

set -a PROJECT_PATHS $HOME/Projects
set -a PROJECT_PATHS $XDG_BIN_HOME/rs

function __sublime_list_projects
    path dirname $PROJECT_PATHS/**sublime-project
end

complete -c sublp -a '(__sublime_list_projects)'
