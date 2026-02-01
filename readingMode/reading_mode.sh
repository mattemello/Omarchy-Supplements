#!/usr/bin/env bash

# CREDITS snes19xx

# Path to shader
SHADER="$HOME/Supplements/readingMode/grayscale.glsl"
WALLPAPER="$HOME/Pictures/wallpaperReading/mounthPerson.png"
WALLPAPER_DEF="$HOME/.config/omarchy/current/background"


# Check active shader
if hyprshade current | grep -q "grayscale"; then
    # Deactivate and Reload
    hyprshade off
    hyprctl reload
    brightnessctl set 60%
    setsid uwsm-app -- swaybg -i "$WALLPAPER_DEF" -m fill >/dev/null 2>&1 &
    qs -c snes-hub
    
    

else
    # ACTIVATES
    hyprshade on "$SHADER"
    pkill qs
    brightnessctl set 37% 
    setsid uwsm-app -- swaybg -i "$WALLPAPER" -m fill >/dev/null 2>&1 &
    # Force E-ink visuals: No animations, no shadows, thin black borders
    hyprctl keyword animations:enabled 0
    hyprctl keyword decoration:drop_shadow 0
    # hyprctl keyword decoration:blur:enabled 0
    hyprctl keyword decoration:rounding 0
    hyprctl keyword general:border_size 0
    hyprctl keyword general:col.active_border "rgba(000000ff)"
    hyprctl keyword general:col.inactive_border "rgba(000000ff)"
    hyprctl keyword decoration:dim_inactive 0
    
fi
