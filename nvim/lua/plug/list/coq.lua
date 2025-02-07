return
{
    {
        "ms-jpq/coq_nvim",
        dependencies = {"neovim/nvim-lspconfig", {"ms-jpq/coq.artifacts", branch = "artifacts"}},
        branch = "coq",
        init = function()

            -- vim.g.coq_settings = {
            --     auto_start = true,
            --     clients = {
            --         lsp = {
            --           enabled = true,
            --         },
            --         tree_sitter = {
            --           enabled = true,
            --           weight_adjust = 1.0
            --         },
            --         tabnine = {
            --           enabled = false,
            --         },
            --         snippets = {
            --           user_path = '/home/mte90/.config/nvim/lua/coq-user-snippets',
            --           weight_adjust = 2
            --         },
            --     },
            -- }
            
            -- require("coq_3p") {
            --   { src = "dap" },
            --   { src = "builtin/js"      },
            --   { src = "builtin/php"     },
            --   { src = "builtin/html"    },
            --   { src = "builtin/css"     },
            -- }

            vim.g.coq_settings = 
            {
                auto_start = "shut-up",
                completion = { always = false },
                display = 
                {
                    pum =
                    {
                        fast_close = false,
                    }
                },
                keymap =
                { 
                    recommended = false,
                    manual_complete = "<C-Space>"
                }
            }
        end
    }
}

