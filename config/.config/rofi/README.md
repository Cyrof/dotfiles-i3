# Rofi Configuration 
This `README` describes the configuration files in this directory for **Rofi**, a minimalist application launcher and dmenu replacement. It covers the folder's structure, prerequisites, theme settings, usage examples, customisation options, and troubleshooting tips.

## 1. Directory Contents
```bash
~/dotfiles-i3/.config/rofi/
├── config.rasi
└── README.md # Current README document
```
- **config.rasi**: Defines Rofi's global settings (`configuration { ... }`), Dracula color palette variables, and style rules for window, list, elements, scrollbar, sidebar, and input bar.

## 2. Prerequisites
Install Rofi on your system:
```bash
# Arch Linux
sudo pacman -S rofi

# Debian/Ubuntu
sudo apt install rofi
```
Ensure you have the `Dracula` palette or desired fonts (e.g., `JetBrains Mono`) installed for custom theming.

## 3. Theme & Appearance
### Global Configuration
```rasi
configuration {
    show-icons:         true;
    display-drun:       "";
    disable-history:    false;
}
```
### Dracula Palette Variables
```rasi
* {
    drac-bgd: #282a36;
    drac-cur: #44475a;
    drac-fgd: #f8f8f2;
    drac-cmt: #6272a4;
    drac-cya: #8be9fd;
    drac-grn: #50fa7b;
    drac-ora: #ffb86c;
    drac-pnk: #ff79c6;
    drac-pur: #bd93f9;
    drac-red: #ff5555;
    drac-yel: #f1fa8c;

    font: "JetBrains Mono 12";
}
```
### Style Rules
- **Window**: Padding, border size/color, border-radius.
- **Listview & Elements**: Spacing, selection colors, states (`normal`, `active`, `urgent`).
- **Input Bar**: Prompt styling, entry text color, case indicator.
- **Scrollbar & Sidebar**: Dimensions and separator colors.

Refers to each `#section { ... }` block in `config.rasi` for detailed control over Rofi's appearance.

## 4. Usage & Keybinding
Launch Rofi in i3 with the custom theme: 
```bash
# in ~/.config/i3/config:
bindsym $mod+d exec rofi -show run -theme ~/.config/rofi/config.rasi
```
Common modes:
- `-show drun` (display desktop entries)
- `-show run`
- `-show window`

To override theme at launch: 
```bash
rofi -show run -theme ~/.config/rofi/config.rasi
```

## 5. Customisation
- **Colors & Fonts**: Modify the `drac-*` variables or `font` declaration.
- **Icon Display**: Toggle `show-icons` in the `configuration` block.
- **Window Shape**: Adjust `border-radius` and `border` size in `#window`.
- **List Behavior**: Change `spacing`, `fixed-height`, or enable `scrollbar`.
- **Prompt Symbol**: Edit `#textbox-prompt-colon` `str` value or color.

Reload Rofi by simply restarting the launcher (no daemon to restart).

## 6. Troubleshooting
- **Theme not applied?**
    - Ensure you launch with `-theme ~/.config/rofi/config.rasi`.
    - Verify `config.rasi` is valid Rasi syntax (no trailing commas).
- **Icons missing?**
    - Confirm `show-icons: true;` and a Nerd Font or icon font is installed.
- **Font not found?**
    - Check that `JetBrains Mono` is installed or change to an available font.

For more options and examples, consult the [Rofi Wiki](https://github.com/davatorium/rofi/wiki).
