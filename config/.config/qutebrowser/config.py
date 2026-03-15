config.load_autoconfig(False)

# --- General ---
c.auto_save.session = True
c.tabs.show = "multiple"
c.tabs.position = "top"
c.scrolling.smooth = True
c.confirm_quit = ["downloads"]
c.content.blocking.enabled = True

# --- Start page / new tab ---
c.url.start_pages = ["https://duckduckgo.com"]
c.url.default_page = "https://duckduckgo.com"

# --- Search engines ---
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "g": "https://www.google.com/search?q={}",
    "gh": "https://github.com/search?q={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "aw": "https://wiki.archlinux.org/?search={}",
}

# --- UI / minimal feel ---
c.statusbar.show = "in-mode"
c.downloads.position = "bottom"
c.window.hide_decoration = False
c.messages.timeout = 3000

# --- Fonts ---
c.fonts.default_size = "10pt"
c.fonts.default_family = ["SauceCodePro Nerd Font", "Source Code Pro", "monospace"]
c.fonts.web.family.standard = "Sans Serif"
c.fonts.web.family.fixed = "monospace"

# ---  Privacy / convenience ---
c.content.autoplay = False
c.input.insert_mode.auto_load = False

# --- Keybindings ---
config.bind("J",  "tab-prev")
config.bind("K", "tab-next")
config.bind("d", "tab-close")
config.bind("xx", "config-cycle statusbar.show always in-mode")
config.bind("tt", "cmd-set-text -s :open -t")
config.bind("ww", "cmd-set-text -s :open")
config.bind("M", "hint links spawn --detact mpv {hint-url}")

# Open clipboard URL
config.bind("pP", "open -- {clipboard}")
config.bind("pt", "open -t -- {clipboard}")

# Dracula-ish simple colors
c.colors.completion.fg = "#f8f8f2"
c.colors.completion.odd.bg = "#282a36"
c.colors.completion.even.bg = "#282a36"
c.colors.completion.category.bg = "#44475a"
c.colors.completion.category.fg = "#f8f8f2"
c.colors.statusbar.normal.bg = "#282a36"
c.colors.statusbar.normal.fg = "#f8f8f2"
c.colors.statusbar.command.bg = "#282a36"
c.colors.statusbar.command.fg = "#f8f8f2"
c.colors.tabs.bar.bg = "#1e1f29"
c.colors.tabs.even.bg = "#282a36"
c.colors.tabs.even.fg = "#f8f8f2"
c.colors.tabs.odd.bg = "#282a36"
c.colors.tabs.odd.fg = "#f8f8f2"
c.colors.tabs.selected.even.bg = "#44475a"
c.colors.tabs.selected.even.fg = "#50fa7b"
c.colors.tabs.selected.odd.bg = "#44475a"
c.colors.tabs.selected.odd.fg = "#50fa7b"
