return
{
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts =
        {
            options =
            {
                icons_enabled = true,
                theme = "auto",
                component_separators = "",
                section_separators = "",
                disabled_filetypes =
                {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = false,
                globalstatus = true,
                refresh =
                {
                    statusline = 1000,
                    refresh_time = 16
                }
            },

            sections =
            {
                lualine_a = {'mode', 'tabs'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename', "searchcount"},
                lualine_x = {"filesize", "filetype"},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            }
        }
    }
}

