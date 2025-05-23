# Neovim Configuration 
This `README` describes the configuration files in this directory for **Neovim**, managed via **lazy.nvim**. It covers the folder's structure, prerequisites, installation steps, plugin overview, customisation, and troubleshooting tips.

## 1. Directory Contents
```bash
~/dotfiles-i3/.config/nvim/
├── init.lua            # Main Neovim entrypoint (loads lazy.nvim)
├── lazy-lock.json      # Plugin lockfile (auto-generated by lazy.nvim)
└── lua
    ├── config
    │   └── lazy.lua    # lazy.nvim setup and plugin import
    └── plugins         # Individual plugin configuration files
        ├── autopairs.lua           # Auto-pairs for brackets, quotes
        ├── comment.lua             # Comment.nvim mappings (gc, gb)
        ├── completion.lua          # nvim-cmp completion sources & behavior
        ├── devicons.lua            # Filetype icons (nvim-web-devicons)
        ├── dracula.lua             # Dracula color scheme setup
        ├── explorer.luah           # File explorer (e.g., nvim-tree)
        ├── lspconfig.lua           # LSP setup (mason, mason-lspconfig, handlers)
        ├── lualine.lua             # Statusline (lualine.nvim)
        ├── markdownViewer.lua      # Markdown preview plugin
        ├── mason-lspconfig.lua     # mason-lspconfig.nvim setup
        ├── mason.lua               # mason.nvim install configuration
        ├── neoscroll.lua           # Smooth scrolling (neoscroll.nvim)
        ├── telescope.lua           # Fuzzy finder (telescope.nvim)
        ├── treesitter.lua          # Syntax & text objects (nvim-treesitter)
        └── whichkey.lua            # Keybinding hints (which-key.nvim)
```

## 2. Prerequisites
- **Neovim v0.8+** (v0.9+ recommended)
- **Git** (for cloning & updating plugins)
- **Node.js** (optional, for some LSP servers & tree-sitter)
- **ripgrep, fd, bat** (enhances Telescope performance)

Install on Arch Linux: 
```
sudo pacman -S neovim git nodejs npm ripgrep fd bat
```
On Debian/Ubuntu:
```
sudo apt install neovim git nodejs npm ripgrep fd-find bat
```

## 3. Installation & Setup
1. Open Neovim: 
    ```
    nvim
    ```
2. Run `:Lazy sync` to install all plugins defined in `lua/config/lazy.lua`.
3. Run `:Mason` and install any LSP servers you need (e.g., `pyright`, `lua_ls`).

After installation completes, restart Neovim to activate all plugins.

## 4. Plugin Overview
| **Plugin** | **Purpose** |
| --- | --- | 
| **lazy.nvim** | Plugin manager & lazy-loading | 
| **nvim-treesitter** | Syntax highlighting, incremental parsing |
| **nvim-cmp** | Autocompletion framework | 
| **LuaSnip** (via cmp) | Snippet engine | 
| **mason.nvim** | Installer for LSP servers, linters, formatters | 
| **mason-lspconfig.nvim** | Bridges mason.nvim & nvim-lspconfig |
| **nvim-lspconfig** | Neovim LSP client configurations | 
| **which-key.nvim** | Popup keybinding hints | 
| **Comment.nvim** | Easy code commenting (`gc`, `gb`) | 
| **nvim-autopairs** | Auto-pairs for brackets & quotes | 
| **telescope.nvim** | Fuzzy finder & picker UI | 
| **nvim-web-devicons** | Filetype icons in UI |
| **lualine.nvim** | Statusline customisation |
| **nvim-tree.lua** | File explorer sidebar |
| **dracula.nvim** | Dracula colorscheme | 
| **markdown-preview.nvim** | In-editor Markdown preview |
| **neoscroll.nvim** | Smooth scrolling animations |

Each plugin's individual settings live in `lua/plugins/*.lua`.

## 5. Customisation
- **Themes**: Modify `lua/plugins/dracula.lua` or switch to another colorscheme.
- **LSP**: Tweak `lua/plugins/lspconfig.lua` for on_attach, capabilities, handlers, and server-specific settings.
- **Keybindings**: Add or adjust mappings in `lua/plugins/whichkey.lua`.
- **Explorer**: Configure view options, icons, and filesystem filters in `explorer.lua`.
- **Statusline**: Change sections, separators, and themes in `lualine.lua`.
- **Completion**: Enable/disable sources or adjust sorting in `completion.lua`.

After any change, reopen Neovim and run `:Lazy sync` (for new plugins) or `:Lazy clean` (to remove orphaned plugins).

## 6. Key Commands
| **Command** | **Description** |
| --- | --- | 
| `:Lazy` | Opens lazy.nvim UI (plugin manager) |
| `:Mason` | Opens Mason UI (LSP/tools installer) |
| `:Telescope find_files` | Fuzzy find files | 
| `:Telescope live_grep` | Search text across files | 
| `:LspInfo` | Show active LSP servers | 
| `:lspsage` | (if installed) UI for LSP actions |

Plus all normal LSP mappings (`gd`, `K`, `<leader>rn`, etc.) defined in your LSP setup.

## 7. Troubleshooting
- **Plugin errors?** Run `:Lazy health` to check for missing dependencies.
- **LSP not attaching?** Ensure you've installed the server via `:Mason` and that `server_name` is in `ensure_installed`.
- **Treesitter parsers missing?** Run `:TSUpdate`.
- **Slow startup?** Profile with `nvim --startuptime nvim.log` and optimise lazy-loading triggers in `lazy.lua`.

For more advanced configuration, see each plugin's documentation on GitHub.
