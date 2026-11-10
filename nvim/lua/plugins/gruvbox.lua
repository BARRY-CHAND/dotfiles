return {"ellisonleao/gruvbox.nvim", 
    name = "gruvbox",
	lazy = false,
    priority = 1000, 
    config = function()
        vim.o.background = "dark"
        vim.cmd([[colorscheme gruvbox]])
		vim.cmd.colorscheme("gruvbox")
    end
}
