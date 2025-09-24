vim.lsp.config("lua_ls", {})
vim.lsp.config("pyright", {})

vim.lsp.config("clangd", {
    cmd = {"clangd", "--function-arg-placeholders=false"}
})

vim.lsp.config("rust-analyzer", {})

vim.lsp.enable({"lua_ls", "pyright", "clangd", "rust-analyzer"})

