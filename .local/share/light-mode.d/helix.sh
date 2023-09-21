#!/bin/sh

perl -i -pe 's/theme = ".*"/theme = "rasmus-bright"/' $XDG_CONFIG_HOME/helix/config.toml

pkill -USR1 hx || true
