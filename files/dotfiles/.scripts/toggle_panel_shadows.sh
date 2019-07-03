#!/bin/bash

###
# Toggles panel shadows.
##

swap_files () {
    cd ~/.local/share/plasma/desktoptheme/$1/widgets/
    mv panel-background.svgz panel-background.svgz.TEMP
    mv panel-background.svgz.BAK panel-background.svgz
    mv panel-background.svgz.TEMP panel-background.svgz.BAK
}

swap_files McMojave
swap_files McMojave-light