# `~/.dotfiles-i3`
This repository contains the configuration files for my environment, organised under a single `.config/` directory. Each subfolder holds settings for a specific application and includes its own `README.md` with detailed setup and customisation instructions.

## Repository Structure
``` bash
.
├── .config
│   ├── i3
│   ├── kitty
│   ├── nvim
│   ├── picom
│   ├── polybar
│   └── rofi
├── .gitignore
├── LICENSE
├── README.md
└── .stow-local-ignore
```

## Prerequisites
Install the following packages (example for Arch Linux):
``` bash
sudo pacman -S i3-gaps kitty neovim picom polybar rofi
```
Make sure you have **GNU Stow** Installed for symlinking:
``` bash
sudo pacman -S stow
```

## Installation 
1. **Clone** this repo:
    ``` bash
    git clone https://github.com/Cyrof/dotfiles-i3.git 
    ```
2. **Create** or switch to your home `.config` target:
    ``` bash
    cd ~/dotfiles-i3
    ```
3. **Symlink** the entire `.config` folder into your `$HOME`:
    ``` bash
    stow -v --target="$HOME" .config
    ```
4. **Reload** or restart your applications: 
    ``` bash
    # i3 example
    i3-msg reload
    ```

## Quick Start
- **i3**: Mod + Return opens Kitty, Mod + D opens Rofi.
- **Neovim**: Launch via `nvim`, then run `:Lazy sync` to install plugins.
- **Polybar**: Auto-started with the provided `launch.sh` script.
- **Picom** & **Rofi**: Automatically loaded by i3 on startup.

Each folder's `README.md` has full details on customisation, keybindings, and troubleshooting.
