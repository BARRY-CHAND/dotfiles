return {
	"numToStr/FTerm.nvim",
	keys = {
		{
			"<A-i>",
			function()
				require("FTerm").toggle()
			end,
			mode = { "n", "t" },
			desc = "Floating terminal",
		},
	},
	opts = {
		border = "single",
		dimensions = { height = 0.8, width = 0.8 },
	},
}
