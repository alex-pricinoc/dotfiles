set -x LESS

set -x -a LESS --quit-if-one-screen
set -x -a LESS --ignore-case
set -x -a LESS -M # Prompt more verbosely
set -x -a LESS -RW # Highlight the first unread line after scrolling the screen for more than one lines
set -x -a LESS -x4 -z-4 -j4
