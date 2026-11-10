return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		check_ts = true, -- use treesitter so pairs are smarter (e.g. not inside strings)
	},
}
