#!/bin/bash

tar -C files/dotfiles -czvf files/dotfiles.tar.gz .
tar -C files/systemwide -czvf files/systemwide.tar.gz .