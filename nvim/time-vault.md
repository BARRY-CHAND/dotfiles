# Neovim config overview (files, purpose, alternatives)

raw notes, short version. build order = top to bottom.

## core files

| file | purpose | notes / alternatives |
|---|---|---|
| init.lua | entry point: mapleader, lazy.nvim bootstrap, loads plugins folder + options, loads base46 cache | lazy.nvim alternatives: packer (archived), vim-plug, mini.deps, rocks.nvim |
| lua/options.lua | editor settings: tabs/indent (4 spaces), number + relativenumber, clipboard, signcolumn, laststatus, timeoutlen | plain vim.opt or vim.cmd("set ...") both work |
| lua/chadrc.lua | nvchad ui settings (theme, statusline), theme picker rewrites it | only needed for nvchad ui |
| lazy-lock.json | auto-generated, pins plugin versions | delete entry to force fresh install |

## plugin files (lua/plugins/)

| file | plugin(s) | purpose | alternatives |
|---|---|---|---|
| gruvbox.lua | ellisonleao/gruvbox.nvim (catppuccin/nvim tried too) | colorscheme | tokyonight.nvim, rose-pine, kanagawa, nvchad base46 themes |
| telescope.lua | telescope.nvim + plenary + telescope-fzf-native | fuzzy find files, live grep (C-p, leader fg) | fzf-lua, snacks.nvim picker, mini.pick |
| treesitter.lua | nvim-treesitter (main branch) | syntax highlight, parsers auto install | no real replacement; master branch = old api |
| neo-tree.lua | neo-tree.nvim (+ nui, plenary, devicons) | file tree sidebar | nvim-tree (nvchad default, lighter), ranger via rnvimr, yazi.nvim, oil.nvim (edit dirs like a buffer), mini.files, netrw (built in) |
| lualine.lua | lualine.nvim | statusline (dropped later) | nvchad ui statusline, heirline, mini.statusline |
| lsp-config.lua | mason.nvim, mason-lspconfig, nvim-lspconfig | install + run language servers (lua_ls, clangd, ts_ls), keymaps hover / gd / code action | skip mason and install servers with pacman then vim.lsp.enable, lsp-zero |
| completions.lua | nvim-cmp, cmp-nvim-lsp, LuaSnip, cmp_luasnip, friendly-snippets | autocomplete + snippets | blink.cmp, mini.completion, coq_nvim; built-in vim.snippet instead of LuaSnip |
| none-ls.lua | none-ls.nvim (stylua, black, isort) | formatting, leader gf | conform.nvim (+ nvim-lint for linting), efm-langserver. dont use two together |
| alpha.lua | alpha-nvim (startify theme) | start screen / dashboard | dashboard-nvim, snacks dashboard, mini.starter, nvchad nvdash |
| barbar.lua | barbar.nvim | buffer tabs, tab / shift-tab to switch | bufferline.nvim, nvchad tabufline, mini.tabline |
| nvchad-ui.lua | nvchad/base46, nvchad/ui, nvchad/volt | nvchad look: statusline, theme picker, icons | full nvchad starter via NVIM_APPNAME test |

## extras added from others 

| plugin | purpose | alternatives |
|---|---|---|
| which-key.nvim | shows keymap hints while typing leader | mini.clue |
| gitsigns.nvim | git changes in gutter, hunk stage / reset / blame | mini.diff, vim-fugitive, neogit, lazygit |
| nvim-colorizer (nvchad fork) | preview color codes | nvim-highlight-colors, mini.hipatterns |
| Comment.nvim | toggle comments | built-in gc / gcc (nvim 0.10+), mini.comment |
| nvim-autopairs | auto close brackets and quotes | mini.pairs |
| FTerm.nvim | floating terminal (alt+i) | toggleterm.nvim, nvchad term, built-in :terminal |
| clipboard option | unnamedplus in options.lua, needs xclip or wl-clipboard | none |

## system tools needed

- neovim 0.11+, git, gcc, make, ripgrep, fd, unzip
- tree-sitter-cli (treesitter main branch)
- nerd font (ttf-jetbrains-mono-nerd)
- xclip or wl-clipboard
- mason installs: lua-language-server, clangd, ts server, stylua, black, isort

## future additions

| addition | purpose | alternatives |
|---|---|---|
| DAP (nvim-dap, nvim-dap-ui, nvim-nio, adapters like debugpy / codelldb) | breakpoints, step through code, see variables inside nvim. own file lua/plugins/dap.lua. python is easiest first | gdb in terminal with pwndbg or GEF (better for c / security), built-in :Termdebug (gdb), vimspector |
| nvim-lint | linters for specific langs (shellcheck bash, ruff python, eslint_d js) | LSP diagnostics already cover most |
| conform.nvim | formatter swap for none-ls | none-ls |
| html language server | add config + enable + ensure_installed | none |
| Comment.nvim upgrade | leader / toggle | built-in gc |
| autopairs + cmp link | adds () after accepting function | none |
| treesitter indent | experimental indentexpr on main branch | neovim default indent |
| urlviw.nvim| provides a telescope of all url in the file| none|
| nvim-numbertoggle.nvim| togles bw absolute and relative number when switching from insert and normal mode | none |


## pending

- git init + first commit in ~/.config/nvim (gitsigns needs repo)
- confirm gruvbox + base46 split works (load only statusline, whichkey, git cache; chadrc theme gruvbox)
- check built-in gc before keeping Comment.nvim
- :Lazy clean leftovers
