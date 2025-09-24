return
{
    {
        "igorlfs/nvim-dap-view",

        ---@module 'dap-view'
        ---@type dapview.Config
        opts = 
        {
            winbar =
            {
                show = true,
                sections = {"watches", "scopes", "console", "repl", "exceptions", "breakpoints", "threads"}
            }
        }
    }
}

