#!/bin/sh

perl -i -pe 's/\*light/\*dark/' $XDG_CONFIG_HOME/alacritty/colorscheme.yml
