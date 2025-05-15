# Picom Compositor Configuration
This `README` describes the configuration file in this directory for the **Picom** compositor. It covers the folder's structure, prerequisites, configurations options, usage, and troubleshooting tips.

## 1. Directory Contents
```bash
~/dotfiles-i3/.config/picom/
├── picom.conf
└── README.md # Current README file
```
- **picom.conf**: Defines backend, vsync, shadows, fading, transparency, and logging settings.

## 2. Prerequisites 
Ensure Picom is installed on your system:
```bash 
# Arch Linux
sudo pacman -S picom

# Debian/Ubuntu
sudo apt install picom
```
If you're migrating from Compton, remove or rename any old `compton.conf`.

## 3. Configuration Options
- **backend**: `xrender` or `glx`. Use `glx` for GPU acceleration if available.
- **vsync**: Synchronise paint to avoid tearing.
- **Shadows**: Adjustable blur radius, offset, and opacity.
- **Fading**: Control fade speed for window transitions.
- **Transparency**: Enabled per-window opacity based on application hints.
- **Logging**: Set to `info`, `warn`, or `trace` for debugging.

## 4. Usage
Start Picom with your custom config: 
```bash
picom --config ~/.config/picom/picom.conf &
```
To autostart under i3, add to `~/.config/i3/config`:
```bash
exec_always --no-startup-id picom --config ~/.config/picom/picom.conf -b
```
Use `-b` to run in the background.

## 5. Troubleshooting
- **No shadows or fading?**
    - Ensure no conflicting compositor is running (e.g., NVIDIA's built-in).
    - Try switching `backend` to `glx` if your GPU supports it.
- **High CPU usage?**
    - Lower `fade-delta` or disable `fading`.
    - Disable expensive options like `experimental-backend`.
- **Tearing persists?**
    - Verify `vsync = true` and `xrender-sync-fence = true`.
    - Test with `picom --benchmark &` to measure performance.

For advanced options and examples, see the [Picom GitHub](https://github.com/yshui/picom) documentation.
