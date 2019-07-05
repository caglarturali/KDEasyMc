#!/bin/bash

###
# Archive updater.
# Run this script after making changes to files/dotfiles and/or files/systemwide dirs.
##

tar -C files/dotfiles -czvf files/dotfiles.tar.gz .
tar -C files/systemwide -czvf files/systemwide.tar.gz .
