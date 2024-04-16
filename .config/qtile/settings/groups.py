# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile workspaces

from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import mod, keys


# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons:
# nf-md-google_earth, 󰊷
# nf-fae-python, 󰌠
# nf-cod-code, 
# nf-dev-terminal, 
# nf-md-nodejs, 󰎙
# nf-dev-git_merge, 
# nf-md-folder, 󰉋
# nf-fa-youtube, 
# nf-linux-archlinux, 

groups = [Group(i) for i in [
    " 󰊷  ", " 󰌠  ", "   ", " 󰎙  ", "  ", "   ", " 󰉋  ", "   ", "   ",
]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])
