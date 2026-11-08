return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "ts_ls" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("lua_ls", {
                capabilities = capabilities
            })
			--vim.lsp.enable("lua_ls")
			vim.lsp.config("clangd", {
                capabilities = capabilities
            })
			--vim.lsp.enable("clangd")
			vim.lsp.config("ts_ls", {
                capabilities = capabilities
            })

			vim.lsp.enable("lua_ls", "clangd", "ts_ls")

			--ENABLING KEYMAPS FOR LSP ACTIONS.
			vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
