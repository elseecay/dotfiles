local utils = require("utils")

local function override_default_keymaps(bufnr)
    local api = require("nvim-tree.api")

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    utils.delkeymap("n", "<C-e>", bufnr)
    -- utils.delkeymap("n", "<C-q>", bufnr)
end

return
{
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts =
        {
            on_attach = override_default_keymaps,
            hijack_cursor = true,
            renderer = 
            {
                highlight_opened_files = "name",
            },
            diagnostics = 
            {
                enable = false
            },
            filters = 
            {
                git_ignored = false,
                custom = 
                {
                    "^\\.git",
                    "^\\.idea",
                    "^venv",
                    "__pycache__"
                }
            }
        }
    }
}

