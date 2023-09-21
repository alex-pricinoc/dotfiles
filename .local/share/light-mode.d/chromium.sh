#!/bin/sh

perl -i -pe '
    s/^--force-dark-mode/# --force-dark-mode/;
    s/,WebContentsForceDark,WebUIDarkMode//
    ' $XDG_CONFIG_HOME/chromium-flags.conf
