# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

import os
import subprocess

import json

from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.layout.tree import TreeNode
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.log_utils import logger

# mod1 is alt
mod = "mod4"  # windows key
terminal = guess_terminal()
home = os.path.expanduser('~')

with open(home + '/.config/dot-files/colors/edge-neon.json') as file:
    theme_colors = file.read()

theme_colors = json.loads(theme_colors)

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),
    Key([mod, "control"], "m", lazy.window.toggle_maximize(), desc="Maximize window"),
    Key([mod, "control"], "n", lazy.window.toggle_minimize(), desc="Minimize window"),
    Key([mod, "control"], "space",
        lazy.window.toggle_floating(), desc="Minimize window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control", "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # Music bindings
    Key([], "XF86AudioPlay", lazy.spawn("mpc toggle"), desc="play/pause"),
    Key([], "XF86AudioNext", lazy.spawn("mpc next"), desc="next track"),
    Key([], "XF86AudioPrev", lazy.spawn("mpc prev"), desc="previous track"),
    Key(
        [], "XF86AudioMute",
        lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
        desc="mute speaker"
    ),
    Key(
        [], "XF86AudioMicMute",
        lazy.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle"),
        desc="mute mic"
    ),
    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ false"),
        lazy.spawn("pactl set-sink-volume 0 +5%"),
        desc="volume up"
    ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ false"),
        lazy.spawn("pactl set-sink-volume 0 -5%"),
        desc="volume down"
    ),

    # Brightness bindings
    Key(
        [], "XF86MonBrightnessUp",
        lazy.spawn("light -A 2"),
        desc="brightness up"
    ),
    Key(
        [], "XF86MonBrightnessDown",
        lazy.spawn("light -U 2"),
        desc="brightness down"
    ),

    # Utils
    Key(
        [mod, "control"], "g",
        lazy.spawn("/home/timo/.config/dmenu_scripts/switch_graphics.sh"),
        desc="switch graphics card"
    ),
    Key(
        [mod], "d",
        lazy.spawn(
            "dmenu_recency -nf '{}' -nb '{}' -sb '{}' -sf '{}' -fn 'monospace-9' -p 'run:'".format(
                theme_colors['color5'], theme_colors['color0'], theme_colors['color5'], theme_colors['color0'],
            ),
        ),
        desc="run dmenu"
    ),
    Key([mod, "shift"], "i", lazy.spawn(
        "/home/timo/.config/rofi/launchers-git/launcherAlt.sh"), desc="applications menu"),
    Key([mod, "control", "mod1"], "l", lazy.spawn(
        "i3lock-fancy"), desc="lock screen"),

    # Applications
    Key([mod], "F2", lazy.spawn("brave"), desc="brave browser"),
    Key([mod], "F3", lazy.spawn("pcmanfm"), desc="file browser"),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

shared_layout_options = {
    "border_width": 2,
    "margin": 4,
    "border_normal": theme_colors["color0"],
    "border_focus": theme_colors["color5"]
}

layouts = [
    layout.Columns(border_focus_stack=[
        '#d75f5f', '#8f3d3d'],
        margin_on_single=8,
        border_on_single=True,
        **shared_layout_options
    ),
    layout.Max(**shared_layout_options),
    # Try more layouts by unleashing below layouts.
    layout.Stack(num_stacks=2),
    layout.Bsp(**shared_layout_options),
    layout.Matrix(**shared_layout_options),
    layout.MonadTall(**shared_layout_options),
    layout.MonadWide(**shared_layout_options),
    layout.RatioTile(**shared_layout_options),
    layout.Tile(**shared_layout_options),
    layout.TreeTab(**shared_layout_options),
    layout.VerticalTile(**shared_layout_options),
    layout.Zoomy(**shared_layout_options),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    "c3n7",
                    foreground=theme_colors['color0'],
                    background=theme_colors['color5'],
                    mouse_callbacks={
                        'Button1': lambda: qtile.cmd_spawn("jgmenu --at-pointer"),
                        "Button3": lambda: qtile.cmd_spawn(
                            "/home/timo/.config/rofi/launchers-git/launcherAlt.sh"
                        ),
                    }
                    #  mouse_callbacks={'Button1': lambda: logger.warning('brave')}
                ),
                widget.GroupBox(
                    active=theme_colors['color5'],
                    block_highlight_text_color=theme_colors['color0'],
                    inactive=theme_colors['color5'],
                    hide_unused=True,
                    background=theme_colors['color0'],
                    foreground=theme_colors['color0'],
                    highlight_color=theme_colors['color1'],
                    highlight_method="block",
                    this_current_screen_border=theme_colors['color5'],
                    urgent_border=theme_colors['color1'],
                ),
                widget.Prompt(
                    foreground=theme_colors['color0'],
                    background=theme_colors['color5'],
                ),
                widget.TaskList(
                    background=theme_colors['color0'],
                    highlight_method="border",
                    icon_size=0,
                    border=theme_colors['color5'],
                    urgent_border=theme_colors['color1'],
                    foreground=theme_colors['color5']
                ),
                # widget.WindowName(
                #     background=theme_colors['color0'],
                #     foreground=theme_colors['color5'],
                # ),
                # widget.Chord(
                #     chords_colors={
                #         'launch': ("#ff0000", "#ffffff"),
                #     },
                #     name_transform=lambda name: name.upper(),
                # ),
                # widget.TextBox("default config", name="default"),
                widget.Mpd2(
                    foreground=theme_colors['color0'],
                    background=theme_colors['color5'],
                ),
                widget.CurrentLayout(
                    foreground=theme_colors['color5'],
                    background=theme_colors['color0'],
                ),
                widget.CPU(
                    background=theme_colors['color5'],
                    foreground=theme_colors['color0'],
                ),
                widget.Memory(
                    foreground=theme_colors['color5'],
                    background=theme_colors['color0'],
                ),
                widget.Volume(
                    background=theme_colors['color5'],
                    foreground=theme_colors['color0'],
                ),
                widget.Battery(
                    foreground=theme_colors['color5'],
                    background=theme_colors['color0'],
                ),
                widget.Clock(
                    format='%b %d(%a), %Y %H:%M',
                    foreground=theme_colors['color0'],
                    background=theme_colors['color5'],
                ),
                widget.QuickExit(
                    foreground=theme_colors['color5'],
                    background=theme_colors['color0'],
                    default_text="log out"
                ),
                widget.Systray(
                    foreground=theme_colors['color5'],
                    background=theme_colors['color0'],
                ),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='pavucontrol'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
], **shared_layout_options)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True


@ hook.subscribe.startup_once
def start_once():
    subprocess.Popen([home + '/.config/dot-files/autostart.sh'])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


# Dependencies
# python-dbus-next
