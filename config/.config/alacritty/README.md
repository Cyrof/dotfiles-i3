# Alacritty Terminal Emulator Configuration

This `README` describes the configuration files in this directory for the **Alacritty** terminal emulator. It covers the folder's structure, installation steps, customisation options, and keybindings.

## 1. Directory Contents

```bash
alacritty/
├── alacritty.toml
├── current-theme.toml
└── README.md
```

- **alacritty.toml**: Primary settings for fonts, scrollback, theme imports, opacity, decorations, padding, clipboard behavior, cursor, and key mappings.
- **current-theme.toml**: Color palette file imported by the main config.

## 2. Prerequisites

Make sure Alacritty is installed on your system:

```bash
# Arch Linux
sudo pacman -S alacritty

# Debian/Ubuntu
sudo apt install alacritty
```

## 3. Font & Appearance

Configured in `alacritty.toml`:

```toml
[font]
normal = { family = "SauceCodePro Nerd Font", style = "Regular" }
bold = { style = "Bold" }
italic = { style = "Italic" }
bold_italic = { style = "Bold Italic" }
size = 12.0
offset = { x = 0, y = 2 }
glyph_offset = { x = 0, y = 1 }
builtin_box_drawing = true

[scrolling]
history = 10000
multiplier = 5

[window]
opacity = 0.7
decorations = "None"
padding = { x = 6, y = 4 }
```

## 4. Theme

A **Dracula-inspired** color scheme is used.

in `alacritty.toml`:

```toml
[general]
import = [
  "~/.config/alacritty/current-theme.toml"
]
```

`current-theme.toml` defines the foreground, background, cursor, selection, and ANSI colors.

## 5. Clipboard, Window & Keybindings

| Shortcut     | Action                      |
| ------------ | --------------------------- |
| Ctrl+Shift+C | Copy selection to clipboard |
| Ctrl+Shift+V | Paste from clipboard        |
| Ctrl+Shift+T | Open a new terminal window  |

These are set via:

```toml
[[keyboard.bindings]]
key = "C"
mods = "Control|Shift"
action = "Copy"

[[keyboard.bindings]]
key = "V"
mods = "Control|Shift"
action = "Paste"

[[keyboard.bindings]]
key = "T"
mods = "Control|Shift"
action = "CreateNewWindow"
```

## 6. Extra Quality of Life Settings

Additional usability options in `alacritty.toml`:

```toml
[general]
live_config_reload = true

[selection]
save_to_clipboard = true

[cursor]
style = { shape = "Block", blinking = "Off" }
unfocused_hollow = true
```

- **live_config_reload**: Reloads the config automatically when changes are saved.
- **save_to_clipboard**: Copies selected text directly to the system clipboard.
- \*\*cursor settings: Keeps the cursor simple and visible.

## 7. Customisation

- **Changing Fonts**: Update the `family` field under `[font]`.
- **Adjusting Spacing**: Modify `offset` and `glyph_offset` for character positioning.
- **Changing Opacity**: Edit `window.opacity`.
- **Changing Theme**: Replace or edit `current-theme.toml`.

## 8. Reloading & Testing

To test the configuration:

```bash
alacritty -v
```

To launch Alacritty normally:

```bash
alacritty
```

If `live_config_reload = true` is enabled, most config changes apply automatically after saving.

## 9. Troubleshooting

- **Alacritty not loading config?** Ensure the file is named `alacritty.toml` and place under `$XDG_CONFIG_HOME/alacritty/` or `~/.config/alacritty/`.
- **Theme import not working?** Verify that `current-theme.toml` exists and the import path is correct.
- **Font issues?** Check that the configured font is installed on your system.
- **Copy/paste not working?** Confirm that the keybinding syntax under `[[keyboard.bindings]]` is correct.
- **Config errors?** Run `alacritty -v` to check for parse or startup errors.

For more details and advanced options, see the [Alacritty Configuration Guide](https://alacritty.org/config-alacritty.html?utm_source=chatgpt.com).
