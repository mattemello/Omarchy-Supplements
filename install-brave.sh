#!/bin/sh

if ! command -v brave &>/dev/null; then
    yay -S --noconfirm --needed brave
fi
