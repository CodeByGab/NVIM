require("config.settings")
require("config.handler")
require("config.lazy")

vim.o.background = "dark"
vim.cmd([[colorscheme pywal16]])

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

local dap = require("dap")

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", function()
	dap.toggle_breakpoint(vim.fn.input("Condition: "))
end, { desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "Run/Continue" })
vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Quit Debug" })

vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })

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

local dap = require("dap")

-- Caminho para o .jar do java-debug-adapter
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/java-debug-adapter/extension/server"
local jar_path = mason_path .. "/com.microsoft.java.debug.plugin-0.53.2.jar"

-- Configura o adaptador Java
dap.adapters.java = function(callback)
	callback({
		type = "server",
		host = "127.0.0.1",
		port = 5005,
		executable = {
			command = "java",
			args = {
				"-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005",
				"-jar",
				jar_path,
			},
		},
	})
end

-- Configura a execução de programas Java
dap.configurations.java = {
	{
		type = "java",
		request = "launch",
		name = "Launch Main",
		mainClass = "Main", -- Aqui você coloca o nome da classe com o main
		projectName = "myproject", -- Nome do projeto (qualquer coisa se não tiver Maven/Gradle)
	},
}
