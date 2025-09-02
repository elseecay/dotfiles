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
                sort_by = "insert_after_current",
                custom_filter = function(buf_number, buf_numbers)
                    -- normal file
                    if vim.bo[buf_number].buftype ~= "" then
                        return false
                    end
                    if vim.bo[buf_number].filetype == "neorepl" then
                        return false
                    end
                    return true
                end
            }
        }
    }
}

