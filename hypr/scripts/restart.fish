#!/usr/bin/fish

kill $(pidof waybar)
kill $(pidof hyprpaper)
waybar
hyprpaper
