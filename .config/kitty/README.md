# Kitty Terminal Emulator Configuration
This `README` describes the configuration files in this directory for the **Kitty** terminal emulator. It covers the folder's structure, installation steps, customisation options, and keybindings.

## 1. Directory Contents
```bash
~/dotfiles-i3/.config/kitty/
├── current-theme.conf
├── kitty.conf
├── kitty.conf.bak
└── README.md
```
- **kitty.config**: Primary settings for fonts, scrollback, tabs, themes, opacity, decorations, and key mappings.
- **kitty.conf.bak**: Backup copy of `kitty.config`.
- **current-theme.conf**: Color palette (Dracula) included by the main config.

## 2. Prerequisites
Make sure Kitty is installed on your system:
```
# Arch Linux
sudo pacman -S kitty

# Debian/Ubuntu
sudo apt install kitty
```

## 3. Font & Appearance
Configured in `kitty.config`:
``` bash
# Font setting
font_family Fira Code
font_size   12.0

# Scrollback history
scrollback_lines 10000

# Tab bar style 
tab_bar_style powerline

# Opacity & decorations
background_opacity          0.7
dynamic_background_opacity  yes
hide_window_decorations     yes
enabled_audio_bell          no
```

## 4. Theme
[Dracula](https://draculatheme.com) color scheme is used. </br>
In `kitty.config`:
```bash
# BEGIN_KITTY_THEME
include current-theme.conf
# END_KITTY_THEME
```
`current-theme.conf` defines the foreground, background, ANSI colors, cursor, and tab colors.

## 5. Tab & Clipboard Keybindings
| **Shortcut** | **Action** | 
| --- | --- |
| Ctrl+Shift+T | Open new tab |
| Ctrl+Shift+W | Close current tab |
| Ctrl+Shift+Right Arrow | Next tab |
| Ctrl+Shift+Left Arrow | Previous tab |
| Ctrl+Shift+C | Copy selection to clipboard |
| Ctrl+Shift+V | Paste from clipboard |

These are set via: 
```bash 
map ctrl+shift+t new_tab
map ctrl+shift+w close_tab
map ctrl+shift+right next_tab
map ctrl+shift+left previous_tab
map ctrl+shift-c copy_to_clipboard
map ctrl+shift-v paste_from_clipboard
```

## 6. Customisation & Backups
- **Backups**: Keep `kitty.conf.bak` as a fallback before making major changes.
- **Switching Themes**: Edit or replace `current-theme.conf` and reload kitty (`kitty @ set-colors --all ~/.config/kitty/current-theme.conf`).

## 7. Troubleshooting 
- **Kitty not loading config?** Ensure the file is named `kitty.config` (or `kitty.conf`) in `$XDG_CONFIG_HOME/kitty`.
- **Theme errors?** Verify `currrent-theme.conf` exists and is valid.
- **Font issues?** Check that `Fira Code` is installed on your system.

For more details and advanced options, see the [Kitty Configuration Guide](https://sw.kovidgoyal.net/kitty/conf/).
