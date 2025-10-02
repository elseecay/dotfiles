vim.lsp.config("lua_ls", {})

vim.lsp.config("pyright",
{
    settings =
    {
        python =
        {
            analysis =
            {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                -- Add other Pyright analysis settings here as needed
                -- For example:
                -- typeCheckingMode = "standard",
                -- diagnosticMode = "openFilesOnly",
            },
        },
    },
})

vim.lsp.config("clangd",
{
    cmd = {"clangd", "--function-arg-placeholders=false"}
})

vim.lsp.config("rust-analyzer", {})

vim.lsp.enable({"lua_ls", "pyright", "clangd", "rust-analyzer"})

