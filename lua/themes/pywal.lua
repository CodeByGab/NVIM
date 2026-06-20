return {
  'uZer/pywal16.nvim',
  lazy = false,
  priority = 1000,
  -- for local dev replace with:
  -- dir = '~/your/path/pywal16.nvim',
  config = function()
    vim.cmd.colorscheme("pywal16")
  end,
}
