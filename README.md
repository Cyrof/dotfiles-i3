# `~/.dotfiles-i3`

This repository contains the configuration files for my Linux environment, organised for easy symlinking with **GNU Stow**. Configurations are primarily stored under `config/.config`, while helper scripts and small utilities are kept in separate folders such as `bin/` and `scripts/`.

Each application folder includes its own `README.md` where applicable, with more detailed setup, usage, and customisation instructions.

## Repository Structure

```bash
.
├── bin
│   └── nvim-chore
├── config
│   └── .config
│       ├── alacritty
│       ├── i3
│       ├── nvim
│       ├── picom
│       ├── polybar
│       ├── .prettierrc.json
│       └── rofi
├── .gitignore
├── LICENSE
├── Makefile
├── README.md
├── scripts
│   └── nvim-chore
│       ├── go.mod
│       ├── main.go
│       └── README.md
└── .stow-local-ignore
```

## Prerequisites

Install the following packages (example for Arch Linux):

```bash
sudo pacman -S i3-gaps alacritty neovim picom polybar rofi
```

Make sure you have **GNU Stow** Installed for symlinking:

```bash
sudo pacman -S stow
```

## Installation

1. **Clone** this repo:
    ```bash
    git clone https://github.com/Cyrof/dotfiles-i3.git
    ```
2. **Create** or switch to your home `.config` target:
    ```bash
    cd ~/dotfiles-i3
    ```
3. **Symlink** the configuration files into your `$HOME`:
    ```bash
    stow -v --target="$HOME" config
    ```
    This will correctly link the contents of `config/.config` into `$HOME/.config`.
4. **Reload** or restart your applications:
    ```bash
    # i3 example
    i3-msg reload
    ```

## Quick Start

- **i3**: Mod + Return opens Alacritty, `Mod + D` opens Rofi.
- **Neovim**: Launch via `nvim`, then run `:Lazy sync` to install plugins.
- **Polybar**: Started with the provided launch script or i3 startup configuration.
- **Picom** & **Rofi**: Automatically loaded by i3 on startup.
- **Alacritty**: Configured as the main terminal emulator.

## Additional Notes

- `bin/` contains a small helper executables intended to be available in your `PATH`.
- `scripts/` contains source code or supporting files for customer utilities.
- A `Makefile` is included for workflow automation and helper commands.

Each folder's `README` contains more detailed information on configuration, customisation, and troubleshooting.
