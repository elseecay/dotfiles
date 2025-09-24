return
{
    {
        "stevearc/quicker.nvim",
        event = "FileType qf",

        ---@module "quicker"
        ---@type quicker.SetupOptions
        opts =
        {
            edit =
            {
                enabled = false
            },
            keys =
            {
                {
                    "<S-Enter>",
                    function() require("quicker").toggle_expand({before = 2, after = 2, add_to_existing = true}) end,
                    desc = "Toggle expandExpand quickfix context",
                }
            }
        }
    }
}

