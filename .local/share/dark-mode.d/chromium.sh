#!/bin/sh

perl -i -pe '
    s/^# --force-dark-mode/--force-dark-mode/;
    s/^--enable-features(?!.*?DarkMode).*/$&,WebContentsForceDark,WebUIDarkMode/
    ' $XDG_CONFIG_HOME/chromium-flags.conf
