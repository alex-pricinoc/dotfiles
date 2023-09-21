#!/bin/sh

perl -i -pe 's/\*dark/\*light/' $XDG_CONFIG_HOME/alacritty/colorscheme.yml
