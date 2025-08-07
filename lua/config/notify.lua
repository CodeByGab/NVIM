-- init.lua (no começo ou final)
vim.notify_orig = vim.notify
vim.notify = function(msg, ...)
  if msg:match("treesitter") then
    return
  end
  vim.notify_orig(msg, ...)
end
