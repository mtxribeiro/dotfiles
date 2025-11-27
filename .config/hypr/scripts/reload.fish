#!/usr/bin/env fish

pkill waybar
pkill hyprpaper

sleep 0.5

waybar &
hyprpaper &
