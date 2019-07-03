#!/bin/bash

###
# KvantumEasyMc.
# Bootstraps a MacOS-like look with Kvantum and some of the most popular themes/icon packages available to date.
# Designed for Debian-based systems. Make this file executable first! (chmod +x ...)
# https://github.com/caglarturali/KvantumEasyMc
##

# Shows colorful output messages.
show_msg () {
    echo -e "\e[33m$1\e[0m"
}

# Set wget progress option.
# https://stackoverflow.com/a/32491843
wget --help | grep -q '\--show-progress' && \
  _PROGRESS_OPT="-q --show-progress --progress=bar:force:noscroll" || _PROGRESS_OPT=""

# Install dependencies/necessary packages
show_msg "Installing dependencies/necessary packages..."
sudo apt install git cmake g++ libx11-dev libxext-dev qtbase5-dev libqt5svg5-dev libqt5x11extras5-dev libkf5windowsystem-dev qttools5-dev-tools build-essential libkf5config-dev libkdecorations2-dev qtdeclarative5-dev extra-cmake-modules libkf5guiaddons-dev libkf5configwidgets-dev libkf5coreaddons-dev libkf5plasma-dev libsm-dev gettext extra-cmake-modules kwin-dev libdbus-1-dev
show_msg "Done."

# Create an temp directory and run there
_TMP_DIR=$(mktemp -d)
cd $_TMP_DIR

# Compile and install Kvantum
show_msg "\nInstalling Kvantum..."
git clone https://github.com/tsujan/Kvantum.git
cd Kvantum && cd Kvantum
mkdir build && cd build
cmake ..
make
sudo make install
show_msg "Done." && cd $_TMP_DIR

# Compile and install SierraBreeze
show_msg "\nInstalling SierraBreeze..."
git clone https://github.com/ishovkun/SierraBreeze.git
cd SierraBreeze
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
sudo make install
show_msg "Done." && cd $_TMP_DIR

# Compile and install Active Window Control Applet
show_msg "\nInstalling Active Window Control Applet..."
git clone git://anongit.kde.org/plasma-active-window-control
cd plasma-active-window-control
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make
sudo make install
show_msg "Done." && cd $_TMP_DIR

# Compile and install Yet Another Magic Lamp
show_msg "\nInstalling Yet Another Magic Lamp..."
git clone https://github.com/zzag/kwin-effects-yet-another-magic-lamp.git
cd kwin-effects-yet-another-magic-lamp
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
make
sudo make install
show_msg "Done." && cd $_TMP_DIR

# Install Latte dock
show_msg "\nInstalling Latte dock..."
sudo apt install latte-dock
show_msg "Done."

# Install McMojave KDE Themes
show_msg "\nInstalling McMojave KDE Themes..."
git clone https://github.com/vinceliuice/McMojave-kde.git
cd McMojave-kde
# Necessary for Active Window Control applet.
sudo cp -r aurorae /usr/local/share/
# Get back on track.
./install.sh
# Install SDDM theme.
cd sddm
sudo ./install.sh
show_msg "Done." && cd $_TMP_DIR

# Install Mojave Gtk Theme
show_msg "\nInstalling Mojave Gtk Theme..."
git clone https://github.com/vinceliuice/Mojave-gtk-theme.git
cd Mojave-gtk-theme
sudo ./install.sh -d /usr/share/themes
show_msg "Done." && cd $_TMP_DIR

# Install McMojave-circle Icon Theme
show_msg "\nInstalling McMojave-circle Icon Theme..."
git clone https://github.com/vinceliuice/McMojave-circle.git
cd McMojave-circle
./install.sh
show_msg "Done." && cd $_TMP_DIR

# Install Capitaine Cursors
show_msg "\nInstalling Capitaine Cursors..."
mkdir $HOME/.icons
git clone https://github.com/keeferrourke/capitaine-cursors.git
cd capitaine-cursors
cp -pr dist/ $HOME/.icons/capitaine-cursors
cp -pr dist-white/ $HOME/.icons/capitaine-cursors-white
show_msg "Done." && cd $_TMP_DIR

# Install SF Mono Font
show_msg "\nInstalling SF Mono Font..."
mkdir -p $HOME/.fonts/SFMono
git clone https://github.com/ZulwiyozaPutra/SF-Mono-Font.git
cp SF-Mono-Font/SFMono-* $HOME/.fonts/SFMono
#sudo fc-cache -fv
show_msg "Done." && cd $_TMP_DIR

# Download wallpapers
show_msg "\nDownloading wallpapers..."
sudo wget $_PROGRESS_OPT http://512pixels.net/downloads/macos-wallpapers/10-15-beta-light.jpg -P /usr/share/wallpapers
sudo wget $_PROGRESS_OPT http://512pixels.net/downloads/macos-wallpapers/10-15-beta-dark.jpg -P /usr/share/wallpapers
show_msg "Done." && cd $_TMP_DIR

# Apply configuration
show_msg "\nApplying configuration..."
wget $_PROGRESS_OPT https://github.com/caglarturali/KvantumEasyMc/raw/master/files/dotfiles.tar.gz
tar -xzf dotfiles.tar.gz -C $HOME
wget $_PROGRESS_OPT https://github.com/caglarturali/KvantumEasyMc/raw/master/files/systemwide.tar.gz
sudo tar -xzf systemwide.tar.gz -C /
show_msg "Done."

# Delete temporary directory
show_msg "\nCleaning up..."
sudo rm -rf $_TMP_DIR
show_msg "Done."

show_msg "\nInstallation complete! Restart your computer for the changes to take effect."
