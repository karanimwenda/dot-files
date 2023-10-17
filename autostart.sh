#!/bin/bash
# wal -R &
nitrogen --restore &
picom &
fix_xcursor &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &  # for networks
xfce4-power-manager &
clipit &
# optimus-manager-qt &

/home/c3n7/.programs/eww/target/release/eww daemon
/home/c3n7/.programs/eww/target/release/eww open clock_side
# /home/c3n7/.programs/eww/target/release/eww open mpd_playing_side
/home/c3n7/.programs/eww/target/release/eww open resource_usage_side

# /home/timo/.config/conky/launch.sh
