
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


--MANAGING REQUIRED PLUGINS
--OPTIONS IE ENABLING THE INSTALLED PLUGINS
--local opts = {}

require("options")
require("lazy").setup("plugins")

--COLOR SCHEME TO CATPPUCCIN.
--require("catppuccin").setup()
--vim.cmd.colorscheme "catppuccin"

--vim.o.background = "dark"
--vim.cmd([[colorscheme gruvbox]])

--vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>', {})




