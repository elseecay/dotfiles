local utils = require("utils")

local packages_list =
{
    -- lsp
    "lua-language-server",
    "pyright",
    "clangd",
    "rust-analyzer",

    "neocmakelsp",

    -- dap
    "cpptools",
    "debugpy"
}

for _, name in pairs(packages_list) do
    if not utils.dir_exist(vim.fn.expand("$MASON/packages/" .. name)) then
        vim.cmd("MasonInstall " .. name)
    end
end
