return {
	"numToStr/FTerm.nvim",
	keys = {
		{
			"<A-i>",
			function()
				require("FTerm").toggle()
			end,
			desc = "Toggle terminal",
		},
	},
}
