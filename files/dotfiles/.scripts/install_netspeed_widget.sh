#!/bin/bash

###
# Installs Netspeed widget.
##

# Create a temp directory and run there.
_TMP_DIR=$(mktemp -d)
cd $_TMP_DIR

git clone https://github.com/dfaust/plasma-applet-netspeed-widget
cd plasma-applet-netspeed-widget
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make
sudo make install

sudo rm -rf $_TMP_DIR
