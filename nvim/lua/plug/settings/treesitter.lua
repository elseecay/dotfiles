local opts =
{
    auto_install = false,

    ensure_installed = 
    {
        "lua", "vim", "vimdoc", "query",
        "markdown", "markdown_inline",
        "bash", "fsh",
        "make", "cmake", "meson",
        "yaml", "toml", "json", "xml",
        "c", "cpp", "rust", "python", "asm",
        "sql", "kotlin", "java", "zig", "php",
        "html", "css", "javascript",
        "proto", "ini"
    },

    highlight =
    {
        enable = true,
        
        disable = function(lang, buf)
            local max_filesize = 200 * 1024 -- 200 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
  
        -- Disable vim builtin highlighting
        additional_vim_regex_highlighting = false
    },
  
    incremental_selection =
    {
        enable = true,
        keymaps =
        {
            init_selection = "<Enter>",
            node_incremental = "<Enter>",
            node_decremental = "<Backspace>",
            scope_incremental = false
        },
    }
}

require("nvim-treesitter.configs").setup(opts)

