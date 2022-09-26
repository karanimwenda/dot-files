#!/bin/sh

# PAD MAPPINGS
#top set
xsetwacom --set 'HUION Huion Tablet_HS611 Pad pad' Button 1 "key ctrl shift z"
xsetwacom --set 'HUION Huion Tablet_HS611 Pad pad' Button 2 "key ctrl z"
xsetwacom --set 'HUION Huion Tablet_HS611 Pad pad' Button 3 "key ctrl p"
xsetwacom --set 'HUION Huion Tablet_HS611 Pad pad' Button 8 "key ctrl shift ="
xsetwacom --set 'HUION Huion Tablet_HS611 Pad pad' Button 9 "key ctrl -"

# https://askubuntu.com/a/1193029
#bottom set
xsetwacom --set 'HUION Huion Tablet_HS611 Pad pad' Button 10 "key +ISO_Level3_Shift +9"         # inserts ]
xsetwacom --set 'HUION Huion Tablet_HS611 Pad pad' Button 11 "key 4"
xsetwacom --set 'HUION Huion Tablet_HS611 Pad pad' Button 12 "key del"
xsetwacom --set 'HUION Huion Tablet_HS611 Pad pad' Button 13 "key 6"
xsetwacom --set 'HUION Huion Tablet_HS611 Pad pad' Button 14 "key +ISO_Level3_Shift +8"          # inserts [


# STYLUS MAPPINGS
# xsetwacom --set 'HUION Huion Tablet_HS611 stylus' Button 1 "key h" # on click
xsetwacom --set 'HUION Huion Tablet_HS611 stylus' Button 2 "key b"
xsetwacom --set 'HUION Huion Tablet_HS611 stylus' Button 3 "key e"
