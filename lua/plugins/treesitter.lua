return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "tsx",
        "typescript",
        "javascript",
        "html",
        "css",
        "scss",
        "c-sharp",
        "yaml",
        "rust",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      autotag = { enable = true },
    },
  },
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
}
