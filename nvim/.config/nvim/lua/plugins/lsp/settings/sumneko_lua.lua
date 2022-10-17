return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- make vim accessible
      },
      format = {
        enable = false,
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}
