local utils = require("utils")

-- configured lsp's are automatically installed - settings/lsp.lua
local packages_list =
{
    -- dap
    "cpptools",
    "debugpy",
}

for _, name in pairs(packages_list) do
    if not utils.dir_exist(vim.fn.expand("$MASON/packages/" .. name)) then
        vim.cmd("MasonInstall " .. name)
    end
end
