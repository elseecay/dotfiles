return
{
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"},
        opts =
        {
            -- All servers set up via lspconfig are automatically installed.
            automatic_installation = true,
        
            -- See `:h mason-lspconfig.setup_handlers()`
            ---@type table<string, fun(server_name: string)>?
            handlers = nil,
        }
    }
}

