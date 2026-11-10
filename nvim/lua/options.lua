-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=4")
-- vim.cmd("set shiftwidth=4")
-- vim.cmd("set softtabstop=4")
-- vim.g.mapleader = " "
-- vim.opt.timeoutlen = 400
-- vim.opt.number = true
-- vim.opt.relativenumber = true
-- vim.opt.laststatus = 3

local options = {
	tabstop = 4,
	shiftwidth = 4,
	softtabstop = 4,

	timeoutlen = 400,

	number = true,
	relativenumber = true,
	signcolumn = "yes", -- for gitsigns

	laststatus = 3, -- for single lualine for enitre nvim.
	clipboard = "unnamedplus", -- clipboard integration
	history = 100, -- command line history

	ignorecase = true, -- ignores case while searching
	smartcase = true, -- but do not ignore while caps are used

	splitkeep = "screen",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.mapleader = " "

vim.diagnostic.config({
	signs = false,
})
