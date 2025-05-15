# Polybar Configuration
This `README` describes the configuration files in this directory for **Polybar**, a fast and easy-to-use status bar. It covers the folder's structure, prerequisites, main configuration options, launch script, and troubleshooting tips.

## 1. Directory Contents
```bash
~/dotfiles-i3/.config/polybar/
├── config.ini
├── launch.sh
└── README.md # Current README file
```
- **config.ini**: Defines colors, fonts, bar settings, modules (left, center, right), and module-specific parameters.
- **launch.sh**: Bash script that kills existing Polybar instances and launches the `i3bar` configurations.

## 2. Prerequisites
Ensure Polybar and required fonts are installed:
```bash
# Arch Linux
sudo pacman -S polybar

# Debian/Ubuntu (via AUR or build from source)
# Install nerd-fonts or SauceCodePro for icons
sudo pacman -S ttf-iosevka-nerd ttf-source-code-pro
```

## 3. Main Configuration (`config.ini`)
### Colors
```ini
[colors]
background       = #282a36
background-alt   = #44475a
foreground       = #f8f8f2
primary          = #bd93f9
secondary        = #ffb86c
alert            = #ff5555
disabled         = #6272a4
```

### Bar Settings
```ini
[bar/i3bar]
width            = 100%
height           = 24pt
background       = ${colors.background}
foreground       = ${colors.foreground}
line-size        = 3pt
font-0           = "Source Code Pro:style=Regular:size=12"
font-1           = "SauceCodePro Nerd Font:style=Regular:size=12"
modules-left     = ewmh memory cpu
modules-center   = xwindow
modules-right    = network date tray
module-margin    = 1
enable-ipc       = true
```

### Modules
- **ewmh (internal/xworkspaces)**: Shows workspaces, highlights active, occupied, urgent, and empty states.
- **memory (internal/memory)**: Displays memory usage (`%percentage_used%%`), updates every 3s, warns above 95%.
- **cpu (internal/cpu)**: Shows CPU load (`%percentage%%`), updates every 0.5s, warns above 95%.
- **xwindow (internal/xwindow)**: Center module showing active window title.
- **network (internal/network)**: Monitors `enp0s8` (wired): shows speed when connected (`%netspeed%%`) or "Disconnected".
- **date (internal/date)**: Displays time (`%H:%M`) and alternate full date/time, updates every second.
- **tray (internal/tray)**: System tray with maximum icon size 24.

Refer to each `[module/<name>]` block in `config.ini` for detailed settings.

## 4. Launch Script (`launch.sh`)
- **killall -q polybar**: Terminates running instances quietly. 
- **polybar i3bar**: Starts the bar defined in `config.ini` under `[bar/i3bar]`.
- **Logging**: Appends output to `/tmp/polybar_i3bar.log`.

Make `launch.sh` executable: 
```bash
chmod +x ~/dotfiles-i3/.config/polybar/launch.sh
```

## 5. Troubleshooting
- **No bar visible?** Ensure `launch.sh` runs on startup and `config.ini` has a `[bar/i3bar]` section.
- **Font or icon missing?** Verify the specified fonts are installed (`Source Code Pro`, `SauceCodePro Nerd Font`).
- **IPC error?** Confirm `enable-ipc = true` in bar settings and restart Polybar.
- **Module not updating?** Check interface names (e.g., `enp0s8`) and adjust `interval` settings.

For complete configuration options, visit the [Polybar Wiki](https://github.com/polybar/polybar/wiki/Configuration).
