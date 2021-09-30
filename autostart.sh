#!/bin/bash
wal -R &
picom &
mpd &
fix_xcursor &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &  # for networks
xfce4-power-manager &
clipit &

/home/timo/.programs/rice/eww/target/release/eww daemon
/home/timo/.programs/rice/eww/target/release/eww open clock_side
/home/timo/.programs/rice/eww/target/release/eww open mpd_playing_side
/home/timo/.programs/rice/eww/target/release/eww open resource_usage_side

# /home/timo/.config/conky/launch.sh