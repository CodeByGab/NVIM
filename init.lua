require("config.settings")
require("config.handler")
require("config.lazy")
require("themes.gruvbox")

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.notify_orig = vim.notify
vim.notify = function(msg, ...)
	if msg:match("treesitter") and msg:match("Index out of bounds") then
		return
	end
	vim.notify_orig(msg, ...)
end
-- vim.api.nvim_set_hl(0, "BufferCurrent", { bg = "none" })
-- vim.api.nvim_set_hl(0, "BufferCurrentMod", { bg = "none" })
-- vim.api.nvim_set_hl(0, "BufferCurrentSign", { bg = "none" })
-- vim.api.nvim_set_hl(0, "BufferCurrentTarget", { bg = "none" })
--
-- vim.api.nvim_set_hl(0, "BufferVisible", { bg = "none" })
-- vim.api.nvim_set_hl(0, "BufferVisibleMod", { bg = "none" })
-- vim.api.nvim_set_hl(0, "BufferVisibleSign", { bg = "none" })
-- vim.api.nvim_set_hl(0, "BufferVisibleTarget", { bg = "none" })
--
-- vim.api.nvim_set_hl(0, "BufferInactive", { bg = "none" })
-- vim.api.nvim_set_hl(0, "BufferInactiveMod", { bg = "none" })
-- vim.api.nvim_set_hl(0, "BufferInactiveSign", { bg = "none" })
-- vim.api.nvim_set_hl(0, "BufferInactiveTarget", { bg = "none" })
--
-- vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
--
