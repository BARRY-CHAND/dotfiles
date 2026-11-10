return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "classic",
		win = { border = "single" },
		icons = { maappings = false },
		spec = {
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>h", group = "hunks" },
			{ "<leader>c", group = "code" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
