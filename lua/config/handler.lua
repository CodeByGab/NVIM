vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if result and result.message and not string.find(result.message, "treesitter") then
    vim.notify(result.message, result.type)
  end
  -- Ignora mensagens que contenham 'treesitter' para não mostrar popup
end
