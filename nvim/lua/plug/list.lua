-- Add:
--  telescope
--  fzf
--  gitsigns
--  nvim-dap-virtual-text


return
{
    -- common dependencies
    {"nvim-lua/plenary.nvim"},
    {"nvim-tree/nvim-web-devicons"},
    {"nvim-neotest/nvim-nio"},

    -- colorschemes
    { 
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
        priority = 1000
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = 
        {
            keywords = { italic = false },
        },
    },

    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
        opts = 
        {
            underline_links = false
        }
    },

    {
        "yorik1984/newpaper.nvim",
        priority = 1000,
        opts = 
        {
            style = "light"
        }
    },

    { 
        "rose-pine/neovim", 
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts =
        {
            variant = "dawn", -- auto, main, moon, or dawn
            dark_variant = "moon",
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = true,
                transparency = false,
            },

            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },

            palette = {
                -- Override the builtin palette per variant
                -- moon = {
                --     base = '#18191a',
                --     overlay = '#363738',
                -- },
            },

            highlight_groups = {
                -- Comment = { fg = "foam" },
                -- VertSplit = { fg = "muted", bg = "muted" },
            },

            before_highlight = function(group, highlight, palette)
                -- Disable all undercurls
                -- if highlight.undercurl then
                --     highlight.undercurl = false
                -- end
                --
                -- Change palette colour
                -- if highlight.fg == palette.pine then
                --     highlight.fg = palette.foam
                -- end
            end,
        }
    },

    -- lualine, beautiful status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts =
        {
            options =
            {
                icons_enabled = true,
                theme = "PaperColor",
                component_separators = "",
                section_separators = "",
                disabled_filetypes =
                {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh =
                {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                }
            },
        
            sections =
            {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename', "searchcount"},
                lualine_x = {"filesize", "filetype"},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
        
            inactive_sections =
            {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
        
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    },

    -- bufferline, multiple buffers inside one tab
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
                sort_by = "insert_after_current"
            }
        }
    },

    -- toggleterm, persist and toggle multiple terminals
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts =
        {
            direction = "horizontal",
            start_in_insert = true,
            insert_mappings = false,
            close_on_exit = true,
            auto_scroll = true
        }
    --     opts = 
    --     {
    --         -- size can be a number or function which is passed the current terminal
    --         -- function(term)
    --         --     if term.direction == "horizontal" then
    --         --         return 15
    --         --     elseif term.direction == "vertical" then
    --         --         return vim.o.columns * 0.4
    --         --     end
    --         -- end,
    --         -- 20
    --         size = 20,
    --         open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
    --         on_create = fun(t: Terminal), -- function to run when the terminal is first created
    --   on_open = fun(t: Terminal), -- function to run when the terminal opens
    --   on_close = fun(t: Terminal), -- function to run when the terminal closes
    --   on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
    --   on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
    --   on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
    --   hide_numbers = true, -- hide the number column in toggleterm buffers
    --   shade_filetypes = {},
    --   autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
    --   highlights = {
    --     -- highlights which map to a highlight group name and a table of it's values
    --     -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    --     Normal = {
    --       guibg = "<VALUE-HERE>",
    --     },
    --     NormalFloat = {
    --       link = 'Normal'
    --     },
    --     FloatBorder = {
    --       guifg = "<VALUE-HERE>",
    --       guibg = "<VALUE-HERE>",
    --     },
    --   },
    --   shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    --   shading_factor = '<number>', -- the percentage by which to lighten dark terminal background, default: -30
    --   shading_ratio = '<number>', -- the ratio of shading factor for light/dark terminal background, default: -3
    --   start_in_insert = true,
    --   insert_mappings = true, -- whether or not the open mapping applies in insert mode
    --   terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    --   persist_size = true,
    --   persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
    --   direction = 'vertical' | 'horizontal' | 'tab' | 'float',
    --   close_on_exit = true, -- close the terminal window when the process exits
    --   clear_env = false, -- use only environmental variables from `env`, passed to jobstart()
    --    -- Change the default shell. Can be a string or a function returning a string
    --   shell = vim.o.shell,
    --   auto_scroll = true, -- automatically scroll to the bottom on terminal output
    --   -- This field is only relevant if direction is set to 'float'
    --   float_opts = {
    --     -- The border key is *almost* the same as 'nvim_open_win'
    --     -- see :h nvim_open_win for details on borders however
    --     -- the 'curved' border is a custom border type
    --     -- not natively supported but implemented in this plugin.
    --     border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    --     -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
    --     width = <value>,
    --     height = <value>,
    --     row = <value>,
    --     col = <value>,
    --     winblend = 3,
    --     zindex = <value>,
    --     title_pos = 'left' | 'center' | 'right', position of the title of the floating window
    --   },
    --   winbar = {
    --     enabled = false,
    --     name_formatter = function(term) --  term: Terminal
    --       return term.name
    --     end
    --   },
    --   responsiveness = {
    --     -- breakpoint in terms of `vim.o.columns` at which terminals will start to stack on top of each other
    --     -- instead of next to each other
    --     -- default = 0 which means the feature is turned off
    --     horizontal_breakpoint = 135,
    --   }
    --     }
    },

    -- mason, lsp/dap downloader/installer
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts =
        {
            ui =
            {
                icons =
                {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },

    -- which-key, hotkey tips
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts =
        {
            triggers =
            {
                { "<leader>", mode = { "n", "v" } },
            }
        }
    },

    -- oil, filesystem editor as a buffer
    {
        'stevearc/oil.nvim',
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {}
    },

    -- nvim-tree, filesystem tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup {}
        end,
    },

    -- autopairs, auto insert closing brackets
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = 
        {
            map_cr = false,
            map_bs = false
        }
    },

    -- lspconfig, lsp client configuration helper
    {
        "neovim/nvim-lspconfig",
        lazy = false
    },

    -- mason-lspconfig, bridge
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"},
        opts =
        {
            -- All servers set up via lspconfig are automatically installed.
            automatic_installation = true,
        
            -- See `:h mason-lspconfig.setup_handlers()`
            ---@type table<string, fun(server_name: string)>?
            handlers = nil,
        }
    },

    -- remove this plugin?
    -- lazydev, autocompletion for nvim lua config files
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts =
        {
            library =
            {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                "lazy.nvim",
                "nvim-dap-ui",
            },

            enabled = function(root_dir)
                return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
            end,
        },
    },

    -- treesitter, syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts =
        {
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            -- :TSInstall <lang>
            ensure_installed = 
            {
                "lua", "vim", "vimdoc", "query",
                "markdown", "markdown_inline",
                "bash", "fsh",
                "make", "cmake", "meson",
                "yaml", "toml", "json", "xml",
                "c", "cpp", "rust", "python", "asm",
                "sql", "kotlin", "java", "zig",
                "html", "css", "javascript"
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
          
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false
            },
          
            -- do not install missing parsers
            auto_install = false
        }
    },

    -- coq_nvim, code completion
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
    },

    -- nvim_dap, debugging
    {
        "mfussenegger/nvim-dap"
    },

    --nvim_dap_ui, interface for nvim_dap
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
    }
}