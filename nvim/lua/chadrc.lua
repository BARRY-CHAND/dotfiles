local M = {}

M.base46 = {
  theme = "gruvbox" -- try "catppuccin", "gruvbox", "tokyonight", etc.
}

M.ui = {
  statusline = {
    theme = "default",           -- "default", "vscode", "vscode_colored", "minimal"
    separator_style = "default", -- "default", "round", "block", "arrow"
  },
  tabufline = { enabled = false }, -- turn on later if you want the top tabs
}

return M
