#!/bin/sh

if ! command -v zathura &> /dev/null; then
    echo "Install zathura first"
    exit 1
fi


if ! zathura -v | grep -wq "pdf"; then 
    echo "Pdf reader for zathura not founded, install it first"
    exit 1
fi

xdg-mime default org.pwmt.zathura.desktop application/pdf

echo "Default pdf reader changed in to zathura"
