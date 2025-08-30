return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		local themes = require("config.themes")
		require("themery").setup({
			themes = themes,
			disable_background = true,
			livePreview = true,
			store = true,
			after = function()
				vim.cmd([[
          hi Normal guibg=NONE ctermbg=NONE
          hi NormalNC guibg=NONE ctermbg=NONE
          hi SignColumn guibg=NONE ctermbg=NONE
          hi EndOfBuffer guibg=NONE ctermbg=NONE
        ]])
			end,
		})
		vim.keymap.set("n", "<leader>cs", ":Themery<CR>", { noremap = true, silent = true })
	end,
}
