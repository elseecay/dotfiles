local esc_in_command_mode = function(cmp)
    if cmp.is_visible() then
        cmp.cancel()
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, true, true), "n", true)
    end
end


return
{
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        -- dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = "1.*",
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
        opts =
        {
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap =
            {
                preset = "none",
                ["<C-Space>"] = {"show"},
                ["<Esc>"] = {"hide", "fallback"},
                ["<Tab>"] = {"select_next", "fallback"},
                ["<S-Tab>"] = {"select_prev", "fallback"},
                ["<Enter>"] = {"accept", "fallback"},
                ["<C-j>"] = {"scroll_documentation_down"},
                ["<C-k>"] = {"scroll_documentation_up"}
            },

            cmdline =
            {
                enabled = true,
                keymap =
                {
                    preset = "none",
                    ["<Tab>"] = {"show", "select_next"},
                    ["<S-Tab>"] = {"select_prev"},
                    ["<Enter>"] = {"accept", "fallback"},
                    ["<C-e>"] = {"hide"},
                    ["<Esc>"] = {esc_in_command_mode}
                }
            },

            -- terminal =
            -- {
            --     enabled = false
            -- },

            appearance =
            {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono"
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion =
            {
                menu =
                {
                    auto_show = false
                },

                documentation =
                {
                    auto_show = true,
                    auto_show_delay_ms = 500
                },

                ghost_text =
                {
                    enabled = false
                },

                list =
                {
                    selection =
                    {
                        preselect = false,
                        auto_insert = false
                    }
                },

                keyword =
                {
                    -- 'prefix' will fuzzy match on the text before the cursor
                    range = "prefix"
                }
            },

            -- Experimental signature help support
            signature =
            {
                enabled = true,
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources =
            {
                default = {"lazydev", "lsp", "path", "buffer"},
                providers =
                {
                    lazydev =
                    {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },

        opts_extend = { "sources.default" }
    }
}

