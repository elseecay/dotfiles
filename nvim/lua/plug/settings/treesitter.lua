local ensure_installed = 
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
}


require("nvim-treesitter").install(ensure_installed)


-- for _, lang in ipairs(ensure_installed) do
--     vim.cmd("silent! TSInstall " .. lang)
-- end

