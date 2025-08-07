return {
  "neovim/nvim-lspconfig",
  dependencies = { "mason-org/mason-lspconfig.nvim" },
  opts = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          telemetry = { enable = false },
        },
      },
    },
    ts_ls = {},
    cssls = {},
    html = {},
    -- pyright = {},
  },

  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Esse on_attach será aplicado a todos os servidores do loop abaixo
    local on_attach = function(_, bufnr)
      local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
      end

      map("n", "gd", vim.lsp.buf.definition)     -- go to definition
      map("n", "gr", vim.lsp.buf.references)     -- go to references
      map("n", "K",  vim.lsp.buf.hover)          -- mostrar documentação
      map("n", "<leader>rn", vim.lsp.buf.rename) -- rename
      map("n", "<leader>ca", vim.lsp.buf.code_action) -- code action
    end

    -- Configura cada server usando o on_attach e os opts respectivos
    for server, server_opts in pairs(opts) do
      server_opts.on_attach = on_attach      -- insere o on_attach
      server_opts.capabilities = capabilities
      lspconfig[server].setup(server_opts)
    end
  end,
}

