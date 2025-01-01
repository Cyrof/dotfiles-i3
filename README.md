# Dotfiles-i3

This repository contains my customised configuration files for [i3wm](https://i3wm.org), a tiling window manager. the setup is minimalist, efficient, and designed to enhance productivity. Below are the features and tools configured in this setup.

## Features
- **Wallpaper Management**: Manged by [Nitrogen](https://wiki.archlinux.org/title/Nitrogen).
- **Transparent Windows**: Enabled using [Picom](https://wiki.archlinux.org/title/Picom).
- **Application Laucher**: [Rofi](https://github.com/davatorium/rofi) for a lightweight and powerful app launcher.
- **Workspace Automation**:
    - **Visual Studio Code**: Always opens in **Workspace 2** for better organisation.
- **Terminal Emulator**: [Kitty](https://sw.kovidgoyal.net/kitty/) for a fast, modern terminal experience with GPU acceleration. 
- **Text Editor**: [Vim](https://wiki.archlinux.org/title/Vim) as the primary editor, configured with a custom `.vimrc` file.
- **Custom Status Bar**: [Polybar](https://wiki.archlinux.org/title/Polybar) for a modern and highly customisable status bar.

## Tools Used
### 1. [Nitrogen](https://wiki.archlinux.org/title/Nitrogen)
- Used to set and resetore wallpapers. 
- Configured to persist the selected wallpaper across reboots.

### 2. [Picom](https://wiki.archlinux.org/title/Picom)
- Provides transparency effects for windows. 
- Runs automatically on i3wm startup.

### 3. [Rofi](https://github.com/davatorium/rofi)
- A fast, customisable application launcher. 
- Mapped to the shortcut `Mod + D` for quick access.

### 4. [VS Code](https://code.visualstudio.com)
- Always opens in **workspace 2** for coding sessions.

### 5. [Kitty](https://sw.kovidgoyal.net/kitty/)
- A fast, GPU-accelerated terminal emulator with extensive customisation options. 
- Includes features like split panes, tabs, and configurable shortcuts. 
- The configuration file for Kitty (`kitty.conf`) is included in respository.

### 6. [Vim](https://wiki.archlinux.org/title/Vim)
- The primary text editor for efficient and keyboard-driven text editing.
- Configured with a custom `.vimrc` file included in the repository.
- The setup supports plugins and features a custom color scheme.

### 7. [Polybar](https://wiki.archlinux.org/title/Polybar)
- A lightweight and modern status bar, configured to replace i3's default bar. 
- Includes modules for CPU usage, memory, network, workspaces, and a clock.
- Configured with **Dracula color scheme** for a cohesive aesthetic. 
- A `launch.sh` script is included to automatically start Polybar with i3.

### 8. [Nerd Fonts](https://www.nerdfonts.com)
- Provides patched fonts with extra icons and glyphs. 
- Recommended font: `SauceCodePro Nerd Font`. 
**Installation (Manjaro)**: 
1. Install Nerd Fonts via the package manager: 
    ```
    sudo pacman -S nerd-fonts 
    ```
2. From the selection menu, choose `ttf-sourcecodepro-nerd`.
3. Update the font cache: 
    ```
    fc-cache -fv
    ```
4. Restart i3 to apply font changes.

## Key Configurations 
### i3wm Configurations
The main i3 configuration file is located at `~/.config/i3/config`. Key customisations include: 
- **Nitrogen** for wallpaper: 
    ```bash
    exec_always --no-startup-id nitrogen --restore
    ```
- **Picom** for transparency: 
    ``` bash
    exec_always --no-startup-id picom
    ```
- **Rofi** for app launching: 
    ``` bash
    bindsym $mod+d exec rofi -show run
    ```
    Note: Make sure to comment or delete the original `bindsym $mod+d` used to open `dmenu`.
- **Workspace assignment for VS Code**:
    ```bash
    assign [class="code"] 2
    ```
- **Kitty** as the terminal emulator: 
    ```bash 
    bindsym $mod+Return exec kitty
    ```
    Note: Make sure to comment or delete the original `bindsym $mod+Return` used to open `x-terminal-emulator`.
- **Polybar** launch script:
    ```bash 
    exec_always --no-startup-id $HOME/.config/polybar/launch.sh &
    ```


## Shortcuts 
- **Open Rofi**: `Mod + D`
- **Open Kitty**: `Mod + Return`

## Kitty Configuration
The repository includes a `kitty.conf` file located in the `kitty/` directory. To use this configurations:
1. Copy the `kitty.conf` file to the appropriate location: 
    ```bash
    cp kitty/kitty.conf ~/.config/kitty/
    ```
2. Copy the `current-theme.conf` file for the Dracula theme: 
    ```
    cp dotfiles-i3/kitty/current-theme.conf ~/.config/kitty/
    ```
3. Restart Kitty or reload the configuration.

## Vim Configuration 
The repository includes a `.vimrc` file located in the `vim/` directory. This file contains custom configurations for Vim, including: 
- **Color Scheme**: Set to [Dracula](https://draculatheme.com/vim).
- **True Color Support**: Enabled for terminals that support it.
### Steps to Use the `.vimrc`: 
1. Copy the `.vimrc` file to your home directory: 
    ``` 
    cp vim/.vimrc ~/.vimrc
    ```
2. Restart vim to apply the new configurations.

## Rofi Configuration 
The **Dracula theme** for Rofi is included and applied by default: 
1. Create a configuration directory: 
    ```
    mkdir -p ~/.config/rofi
    ```
2. Copy the `config.rasi` file: 
    ``` 
    cp dotfiles-i3/rofi/config.rasi ~/.config/rofi/
    ```

## Polybar Configuration
The polybar configuration files are located in the `polybar` directory: 
- `config.ini`: Defines the bar layout, modules, and appearance.
- `launch.sh`: Script to launch Polybar.


### Steps to Use the `.vimrc`:
1. Copy the `.vimrc` file to your home directory: 
    ```bash 
    cp vim/.vimrc ~/.vimrc
    ```
2. Ensure Vim supports true color: 
    ```bash 
    set termguicolors
    ```
3. Restart Vim to apply the new configurations.

## How to Use
1. Clone this repository: 
    ```bash 
    git clone https://github.com/Cyrof/dotfiles-i3.git
    ```
2. Copy the configuration files to the appropriate directories: 
    ```bash 
    cp dotfiles-i3/config ~/.config/i3/
    cp dotfiles-i3/kitty/kitty.conf ~/.config/kitty/
    cp dotfiles-i3/kitty/current-theme.conf ~/.config/kitty/
    cp dotfiles-i3/vim/.vimrc ~/.vimrc
    cp dotfiles-i3/polybar/config.ini ~/.config/polybar/
    cp dotfiles-i3/polybar/launch.sh ~/.config/polybar/
    cp dotfiles-i3/rofi/config.rasi ~/.config/rofi/
    ```
3. Reload the i3 configuration:
    ``` bash 
    Mod + Shift + R 
    ```
4. Ensure **tools** are installed: 
    ``` bash 
    sudo pacman -S nitrogen picom rofi kitty vim polybar
    ```

## Future Enhancements 
- Add more keybingings for navigation. 
- Explore transparency effects. 
- Add plugin management for Vim.

## References
- [i3wm Documentation](https://i3wm.org)
- [Arch Wiki: Nitrogen](https://wiki.archlinux.org/title/Nitrogen)
- [Arch Wiki: Picom](https://wiki.archlinux.org/title/Picom)
- [Rofi GitHub Repository](https://github.com/davatorium/rofi)
- [Kitty Documentation](https://sw.kovidgoyal.net/kitty/)
- [Arch Wiki: Vim](https://wiki.archlinux.org/title/Vim)
- [Dracula Theme for Rofi](https://draculatheme.com/rofi)
- [Arch Wiki: Polybar](https://wiki.archlinux.org/title/Polybar)


