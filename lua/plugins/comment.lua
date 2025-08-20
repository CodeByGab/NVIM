return {
  "numToStr/Comment.nvim",
  opts = {
    padding = true,
    sticky = true,
    mappings = {
      basic = true,
      extra = true,
    },
    pre_hook = function(ctx)
      return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()(ctx)
    end,
  },
}
