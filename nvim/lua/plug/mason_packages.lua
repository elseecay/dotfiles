local mason_registry = require("mason-registry")


local packages_list =
{
    -- lsp
    "lua-language-server",
    "clangd",
    "pyright",
    "rust-analyzer",

    -- dap
    "cpptools",
    "debugpy",
}

for _, name in pairs(packages_list) do
    if not mason_registry.is_installed(name) then
        vim.cmd(string.format("MasonInstall %s", name))
    end
end
