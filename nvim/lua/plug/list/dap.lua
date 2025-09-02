return
{
    {
        "mfussenegger/nvim-dap"
    },

    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies =  {"mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter"},
        opts =
        {
            virt_text_pos = "eol"
        }
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        opts =
        {
            controls =
            {
                element = "repl",
                enabled = false,
                icons =
                {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = ""
                }
            },
            element_mappings = {},
            expand_lines = true,
            floating =
            {
                border = "single",
                mappings =
                {
                    close = { "q", "<Esc>" }
                }
            },
            force_buffers = true,
            icons =
            {
                collapsed = "",
                current_frame = "",
                expanded = ""
            },
            layouts =
            {
                {
                    elements =
                    {
                        {
                            id = "scopes",
                            size = 0.4
                        },
                        {
                            id = "watches",
                            size = 0.35
                        },
                        {
                            id = "stacks",
                            size = 0.25
                        }
                    },
                    position = "left",
                    size = 40
                },
                {
                    elements =
                    {
                        {
                            id = "repl",
                            size = 1.0
                        },
                    },
                    position = "bottom",
                    size = 10
                }
            },
            mappings =
            {
                edit = "e",
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t"
            },
            render =
            {
                max_type_lentgh = 10,
                indent = 1,
                max_value_lines = 100
            }
        }
    }
}

