return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  keys = {
    { "<C-p>", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
  },

  opts = function()
    return {
      defaults = {
        layout_strategy = "vertical",
        sorting_strategy = 'ascending',
        layout_config = {
          vertical = {
            mirror = true,
            prompt_position = 'top',
          }
        },
      },
      extensions = {
        ["ui-select"] = require("telescope.themes").get_dropdown({}),
      },
    }
  end,

  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("ui-select")
  end,
}
