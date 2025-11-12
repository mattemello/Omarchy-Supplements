#!/bin/sh

./install-brave.sh
./install-zsh.sh
./install-ghostty.sh
./install-stow.sh
./install-omarchy-changes.sh
./install-dotfiles.sh

echo " "
echo "INSTALLATION COMPLETE"
echo " "

./set-shell.sh
./set-brave.sh

echo " "
echo "ALL DONE, REDY TO GO!"
