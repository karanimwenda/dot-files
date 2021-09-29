#!/bin/bash
wal -R &
picom &
mpd &
fix_xcursor &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &  # for networks
xfce4-power-manager &
clipit &
/home/timo/.config/conky/launch.sh