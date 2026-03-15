# Qutebrowser Configuration

This `README` describes the configuration files in this directory for **qutebrowser**, a keyboard-driven web browser with Vim-like controls. It covers the folder's structure, prerequisites, installation steps, configuration highlights, usage examples, customisation options, and troubleshooting tips.

## 1. Directory Contents

```bash
dotfiles-i3/.config/qutebrowser/
├── config.py
└── README.md
```

- **config.py**: Main qutebrowser configuration file written in Python. It defines browser behavior, UI preferences, search engines, fonts, keybindings, and optional theme settings.
    > Note: qutebrowser may also generate files such as `quickmarks`, `bookmarks/`, or `greasemonkey/`, but for a clean dotfiles repository only `config.py` is typically tracked.

## 2. Prerequisites

Install qutebrowser on your system:

```bash
# Arch Linux
sudo pacman -S qutebrowser

# Debian/Ubuntu
sudo apt install qutebrowser
```

Optional utilities for enhanced functionality:

```bash
# Clipboard support / video playback
sudo pacman -S xclip mpv

# Debian/Ubuntu
sudo apt install xclip mpv
```

Ensure your preferred fonts are installed if referenced in `config.py` (e.g. `SauceCodePro Nerd Font`, `Source Code Pro`, or other monospace fonts.)

## 3. Configuration Overview

qutebrowser uses a Python-based configuration file instead of a static theme format like Rasi or INI.

### Basic Startup

A minimal configuration usually begins with:

```python
config.load_autoconfig(False)
```

This disables automatic config writes from the GUI so that all settings remain controlled from `config.py`

### Common Settings

Typical settings configuredd in `config.py` may include:

```python
c.auto_save.session = True
c.tabs.show = "multiple"
c.scrolling.smooth = True
c.confirm_quit = ["downloads"]
c.content.blocking.enabled = True
```

These control session restore, tab visibility, smooth scrolling, quit confirmations, and built-in content blocking.

### Search Engines

Custom search shortcuts can be defined:

```python
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "g": "https://www.google.com/search?q={}",
    "gh": "https://github.com/search?q={}",
    "yt": "https://www.youtube.com/results?search_query={}",
}
```

This allows commands like:

- `:open github`
- `:open g qutebrowser config`
- `:open gh dotfiles-i3`

### Fonts

Fonts can be customised directly in Python:

```python
c.fonts.default_size = "10pt"
c.fonts.default_family = ["SauceCodePro Nerd Font", "Source Code Pro", "monospace"]
```

## 4. Theme & Appearance

qutebrowser can be kept minimal using its default theme, or styled manually through color values in `config.py`.

### Example Color Overrides

```python
c.colors.statusbar.normal.bg = "#282a36"
c.colors.statusbar.normal.fg = "#f8f8f2"
c.colors.tabs.bar.bg = "#1e1f29"
c.colors.tabs.selected.even.bg = "#44475a"
c.colors.tabs.selected.even.fg = "#50fa7b"
```

These can be used to create a Dracula-inspired appearance to better match the rest of the desktop setup.

### UI Options

Common appearance-related settings include:

- **Tabs**: Position, visibility, selected tab colors
- **Statusbar**: Always visible or visible only in command/insert modes
- **Downloads bar**: Top or bottom position
- **Messages**: Timeout duration
- **Window decorations**: Hide/show titlebar borders depending on WM preference

## 5. Usage & Keybinding

Launch qutebrowser directly:

```bash
qutebrowser
```

Example i3 keybindings:

```bash
# in ~/.config/i3/config
bindsym $mod+Shift+b exec qutebrowser
```

qutebrowser already includes built-in Vim-style controls.

### Common Defaul Keybindings

- `j`/`k` &mdash; Scroll down / up
- `h`/`l` &mdash; Navigate back / forward (context dependent)
- `f` &mdash; show link hints
- `F` &mdash; Open hinted link in a new tab
- `o` &mdash; Open URL
- `O` &mdash; Edit current URL
- `t` &mdash; Open new tab
- `:` &mdash; Enter command mode
- `r` &mdash; Reload page
- `R` &mdash; Hard reload

### Example Custom Keybindings

Custom binds can be added in `config.py`:

```python
config.bind("J", "tab-prev")
config.bind("K", "tab-next")
config.bind("d", "tab-close")
config.bind("tt", "cmd-set-text -s :open -t")
config.bind("ww", "cmd-set-text -s :open")
```

These improve keyboard-based tab and navigation workflows, especially in tiling window managers like i3.

## 6. Customisation

qutebrowser is highly configurable through Python.

Common areas to customise:

- **Homepage / start page**
- **Default search engine**
- **Fonts and text sizes**
- **Tab behavior**
- **Dark mode**
- **Custom keybindings**
- **Privacy and blocking settings**
- **Clipboard and media integration**

### Example Start Page

```python
c.url.start_pages = ["https://duckduckgo.com"]
c.url.default_page = "https://duckduckgo.com"
```

### Example Clipboard Bindings

```python
config.bind("pP", "open -- {clipboard}")
config.bind("pt", "open -t -- {clipboard}")
```

### Example mpv Integration

```python
config.bind("M", "hint links spawn --detach mpv {hint-url}")
```

This opens media links externally using `mpv`.

## 7. Troubleshooting

- **qutebrowser does not launch?**
    - Ensure the package is installed correctly.
    - On Arch-based systems, try reinstalling with:
        ```bash
        sudo pacman -Rns qutebrowser
        sudo pacman -Syu qutebrowser
        ```
- **Font not applied?**
    - Confirm the referenced font is installed on the system.
    - Check spelling in `config.py`.
- **Browser looks unthemed?**
    - Verify that color settings are present in `config.py`.
    - Ensure `config.load_autoconfig(False)` is set if you want your config file to take priority.
- **Rendering issues in VM or older hardware?**
    - Try enabling software rendering:
        ```python
        c.qt.force_software_rendering = "chromium"
        ```
- **Some websites behave oddly?**
    - qutebrowser uses QT WebEngine, so a few sites may behave differently from Chromium or Firefox.
    - For problematic websites, keeping a secondary browser installed can be useful.

## Notes

This setup is intended for a minimal, keyboard-driven workflow and pairs well with i3wm. The main tracked file in this directory is usually only `config.py`, keeping the dotfiles repository clean and focused on intentional configuration.

For more options and examples, consult the [qutebrowser Documentation](https://qutebrowser.org/doc/help/).
