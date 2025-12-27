local cmd =
{
    "clangd",
    "--function-arg-placeholders=false"
}

vim.lsp.config("clangd",
{
    cmd = cmd
})


vim.lsp.enable({"clangd"})

