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
