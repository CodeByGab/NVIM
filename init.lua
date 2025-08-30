require("config.settings")
require("config.handler")
require("config.lazy")

vim.o.background = "dark"
vim.cmd([[colorscheme evergarden-winter]])

vim.notify_orig = vim.notify
vim.notify = function(msg, ...)
	if msg:match("treesitter") and msg:match("Index out of bounds") then
		return
	end
	vim.notify_orig(msg, ...)
end
local themery_file = vim.fn.stdpath("data") .. "/themery.vim"
if vim.fn.filereadable(themery_file) == 1 then
	vim.cmd("source " .. themery_file)
end
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dr", ":DapContinue<CR>", { noremap = true, silent = true })
vim.opt.guicursor:append("a:blinkon400-blinkoff200")

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

-- Adiciona fundo transparente no neovim

-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	callback = function()
-- 		vim.cmd([[
--       hi Normal guibg=NONE ctermbg=NONE
--       hi NormalNC guibg=NONE ctermbg=NONE
--       hi SignColumn guibg=NONE ctermbg=NONE
--       hi EndOfBuffer guibg=NONE ctermbg=NONE
--     ]])
-- 	end,
-- })
