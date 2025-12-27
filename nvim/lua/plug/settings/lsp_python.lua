vim.lsp.config("pyright",
{
    settings =
    {
        python =
        {
            analysis =
            {
                -- For settings pyproject.toml [tool.pyright] section
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly"
            },
        },
    },
})


vim.lsp.enable({"pyright"})
