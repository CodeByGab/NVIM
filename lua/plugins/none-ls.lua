return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"mason.nvim",
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	opts = function()
		local none_ls = require("null-ls")

		none_ls.setup({
			sources = {
				none_ls.builtins.formatting.stylua,
				none_ls.builtins.formatting.prettier,
				require("none-ls.diagnostics.eslint_d"),
				-- none_ls.builtins.diagnostics.eslint_d,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
