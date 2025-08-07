return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
      window = {
        width = 25,
        auto_expand_width = true,
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
      vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>",
      {
        noremap = true,
        silent = true
      })
    end,
  }
}
