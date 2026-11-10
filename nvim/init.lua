vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
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

require("options")
require("lazy").setup("plugins")

-- load NvChad's cached highlights (after lazy setup)
--pcall(dofile, vim.g.base46_cache .. "defaults") -- IF WE USE THIS DEFAULTS WILL BE FROM NV-CHAD UI
pcall(dofile, vim.g.base46_cache .. "statusline")
pcall(dofile, vim.g.base46_cache .. "git")
--pcall(dofile, vim.g.base46_cache .. "whichkey") -- FOR WHICH KEY POP UP(TECHNICALLY NOT NEEDED JUST TESTING IT....
