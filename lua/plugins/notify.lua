return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      top_down = false,
      render = "simple",
      stage = "fade",
      fps = 60,
    })
  end,
}
