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

                -- SHIT NOT WORKING:
                -- diagnosticMode = "openFilesOnly",
                -- ["off", "basic", "standard", "strict"]
                -- typeCheckingMode = "basic",
                -- ["none", "warning", "information", "error"]
                -- reportAttributeAccessIssue = "information"
            },
        },
    },
})


vim.lsp.enable({"pyright"})
