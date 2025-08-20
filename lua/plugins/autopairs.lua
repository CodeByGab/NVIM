return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",

	dependencies = {
		"windwp/nvim-ts-autotag",
	},

	config = function()
		require("nvim-autopairs").setup({
			check_ts = true,
			ts_config = {
				html = { "string" },
				javascript = { "template_string" },
				xml = { "string" },
			},
		})

		require("nvim-ts-autotag").setup()
	end,
}
