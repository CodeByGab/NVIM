return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- só carrega ao abrir um arquivo
  opts = {
    signs = {
      add          = { text = "+" },  -- linha adicionada
      change       = { text = "~" },  -- linha modificada
      delete       = { text = "-" },  -- deletada
      topdelete    = { text = "‾" },
      changedelete = { text = "_" },
    },
    current_line_blame = false,  -- mostrar autor/commit na linha (pode ativar se quiser)
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)

    -- atalhos úteis:
    local gs = require("gitsigns")

    -- Próximo/Anterior hunk
    vim.keymap.set("n", "]c", function() gs.next_hunk() end)
    vim.keymap.set("n", "[c", function() gs.prev_hunk() end)

    -- Stage / Reset hunk
    vim.keymap.set("n", "<leader>gs", function() gs.stage_hunk() end)
    vim.keymap.set("n", "<leader>gr", function() gs.reset_hunk() end)

    -- Preview do hunk
    vim.keymap.set("n", "<leader>gp", function() gs.preview_hunk() end)

    -- Toggle blame na linha atual
    vim.keymap.set("n", "<leader>gb", function() gs.toggle_current_line_blame() end)
  end,
}

