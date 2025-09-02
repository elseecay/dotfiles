local lsp = require("lspconfig")


-- After setting up mason-lspconfig you may set up servers via lspconfig
lsp.lua_ls.setup {}
lsp.pyright.setup {}
lsp.clangd.setup {}
lsp.rust_analyzer.setup {}

