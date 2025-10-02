return
{
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    opts =
    {
        input =
        {
            enabled = true
        },
        bigfile =
        {
            enabled = true,
            notify = true,
            size = 1.5 * 1024 * 1024
        },
        quickfile =
        {
            enabled = true,
            exclude = {}
        },
        notifier =
        {
            enabled = true
        },
        dim =
        {
            enabled = true,
            animate =
            {
                enabled = false
            }
        },

        styles =
        {
            notification =
            {
                border = "rounded",
                zindex = 100,
                ft = "markdown",
                focusable = false,
                wo =
                {
                    winblend = 5,
                    wrap = false,
                    conceallevel = 2,
                    colorcolumn = "",
                },
                bo =
                {
                    filetype = "snacks_notif"
                },
            }
        }
    }
}

