#!/bin/sh

# Check if brave is installed
if ! command -v brave &>/dev/null; then
    echo "Zsh is not installed. Please run ./install-packages.sh first."
    exit 1
fi

BRAVE_NAME="brave-browser.desktop"
BROWSER_NOW=$(xdg-settings get default-web-browser)

if [ "$BROWSER_NOW" = "$BRAVE_NAME" ]; then
    echo "Brave is already your default browser."
    exit 0
fi

xdg-settings set default-web-browser "$BRAVE_NAME"

echo "Default browser changed to brave."
