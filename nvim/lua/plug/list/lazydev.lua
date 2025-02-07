return
{
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts =
        {
            library =
            {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                "lazy.nvim",
                "nvim-dap-ui",
            },

            enabled = function(root_dir)
                return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
            end,
        },
    }
}

