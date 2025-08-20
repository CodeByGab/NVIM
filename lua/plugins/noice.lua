return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
    views = {
      -- caixa de comandos
      cmdline_popup = {
        border = {
          style = "shadow", -- opções: "single", "double", "rounded", "solid", "shadow"
          padding = { 1, 1 },
        },
        position = {
          row = "50%", -- vertical
          col = "50%", -- horizontalmente
        },
        size = {
          width = 60,
          height = "auto",
        },
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
}
