# Como instalar uma nova linguagem

## Treesitter

1. Procurar dentro do comando `:TSInstall` a linguagem que você quer instalar.
2. Depois ir em seu `treesitter.lua` e colocar a nova linguagem:

```lua
ensure_installed = {
  "nova_linguagem",
}
```

## Mason

1. Instalar o LSP dentro do plugin do Mason pelo menu do alpha.
2. Dentro do arquivo `lspconfig.lua`, colocar o novo LSP:

```lua
opts = {
  novo_lsp = {},
}
```

## NoneLS

1. Instalar o Linter ou Formatter dentro do Mason pelo menu do alpha.
2. Adicionar no `none-ls.lua` dentro do `setup`:

```lua
none_ls.setup({
  sources = {
    -- para um novo Formatter
    none_ls.builtins.formatting.FORMATTER,
    -- para um novo Linter
    none_ls.builtins.diagnostics.LINTER,
  },
})
```

