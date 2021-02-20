#!/bin/python

import os
from pathlib import Path

home_dir = str(Path.home())

xresources = ""

with open(home_dir + "/.cache/wal/colors.Xresources") as f:
    xresources = f.read()

with open(home_dir + "/.config/dot-files/color-generator/src/.Xresources") as f:
    xresources = xresources + "\n" + f.read()

# Output it as the config
with open(home_dir + "/.Xresources", 'w') as f:
    f.write(xresources)

os.system("xrdb ~/.Xresources")
