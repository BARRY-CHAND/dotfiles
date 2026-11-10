return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		-- thin bars in the left margin, like NvChad
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "│" },
		},

		on_attach = function(bufnr)
			local gs = require("gitsigns")

			local function map(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
			end

			-- jump between changes
			map("]c", function()
				gs.nav_hunk("next")
			end, "Next change")
			map("[c", function()
				gs.nav_hunk("prev")
			end, "Previous change")

			-- hunks (a "hunk" = one block of changed lines)
			map("<leader>hp", gs.preview_hunk, "Preview change")
			map("<leader>hs", gs.stage_hunk, "Stage change")
			map("<leader>hr", gs.reset_hunk, "Undo change")

			-- blame and diff
			map("<leader>gb", gs.blame_line, "Who changed this line")
			map("<leader>gt", gs.toggle_current_line_blame, "Toggle inline blame")
			map("<leader>gd", gs.diffthis, "Diff against last commit")
		end,
	},
}
