#!/bin/bash

###
# Installs Redshift Control applet for the Plasma Desktop.
##

# Create a temp directory and run there.
_TMP_DIR=$(mktemp -d)
cd $_TMP_DIR

sudo apt install redshift qml-module-qtgraphicaleffects -y
git clone https://github.com/KDE/plasma-redshift-control.git
cd plasma-redshift-control
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make
sudo make install

sudo rm -rf $_TMP_DIR
