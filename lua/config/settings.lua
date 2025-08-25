-- Desabilitar netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Configurações básicas de tabulação
local tab = 2
vim.opt.expandtab = true
vim.opt.tabstop = tab
vim.opt.softtabstop = tab
vim.opt.shiftwidth = tab

-- Deixa uma margem de 5 linhas no começo e no fim
vim.opt.swapfile = false
vim.o.scrolloff = 10

-- Ativa o treesitter sempre nesses arquivos
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescriptreact", "tsx", "scss", "css", "javascript" },
	callback = function()
		vim.cmd("TSBufEnable highlight")
	end,
})

-- Code folding do vim
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false -- começa com tudo aberto

vim.o.splitright = true;

vim.cmd("set number")

vim.keymap.set("n", "<leader>z", function()
	require("zen-mode").toggle()
end, { desc = "Toggle Zen Mode" })

