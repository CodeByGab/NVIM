return {
	"mason-org/mason-lspconfig.nvim",
	version = "v1.32.0",
	opts = {
		ensure_installed = {
			"lua_ls",
			"ts_ls",
			"cssls",
			"html",
			"omnisharp",
			"clangd",
		},
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ensure_installed = {
					"prettier",
					"stylua",
					"clang-format",
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
}
