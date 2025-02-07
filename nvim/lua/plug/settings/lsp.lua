local lsp = require("lspconfig")


-- After setting up mason-lspconfig you may set up servers via lspconfig
lsp.lua_ls.setup {}
lsp.pyright.setup {}
lsp.clangd.setup {}
lsp.rust_analyzer.setup {}


-- Requires 2 lines of change to support LSP snippets
-- local lsp = require "lspconfig"
-- local coq = require "coq" -- add this
-- lsp.<server>.setup(<stuff...>)                              -- before
-- lsp.<server>.setup(coq.lsp_ensure_capabilities(<stuff...>)) -- after