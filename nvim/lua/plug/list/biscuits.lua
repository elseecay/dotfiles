return
{
    "code-biscuits/nvim-biscuits",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts =
    {
        default_config =
        {
            max_length = 30,
            min_distance = 5,
            prefix_string = " 📎 "
        },
        cursor_line_only = true,
        show_on_start = false,
        max_file_size = "100kb"
    }
}

