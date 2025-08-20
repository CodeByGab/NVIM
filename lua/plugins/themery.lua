return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    local themes = require("config.themes")
    require("themery").setup({
      themes = themes,
      disable_background = true,
    })
    vim.keymap.set("n", "<leader>cs", ":Themery<CR>", { noremap = true, silent = true })
  end,
}
