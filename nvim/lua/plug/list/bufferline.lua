return
{
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts =
        {
            options = 
            {
                mode = "buffers",
                themable = true,
                numbers = "none",
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                enforce_regular_tabs = true,
                show_tab_indicators = false,
                separator_style = nil,
                sort_by = "insert_after_current"
            }
        }
    }
}

