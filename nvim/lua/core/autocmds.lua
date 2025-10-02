local function set_background_by_colorscheme(name)
    local lower = name:lower()
    if lower:match("light") then
        vim.opt.background = "light"
    elseif lower:match("dark") then
        vim.opt.background = "dark"
    else
        local dark =
        {
            G.default_dark_colorscheme, G.main_dark_colorscheme,
            "eldritch", "lytmode", "habamax",
            "tokyonight-moon", "tokyonight-storm", "tokyonight-night",
            "rose-pine-moon", "rose-pine-main",
            "neon", "nord", "sorbet"
        }
        for _, value in ipairs(dark) do
            if lower:find(value, 1, true) then 
                vim.opt.background = "dark";
                return
            end
        end
        vim.opt.background = "light"
    end
end

vim.api.nvim_create_autocmd("ColorScheme",
{
    pattern = "*",
    callback = function(args)
        local name = args.match or vim.g.colors_name or ""
        set_background_by_colorscheme(name)
    end,
})

-- -- Make [No name] buffers readonly
-- vim.api.nvim_create_autocmd("BufEnter",
-- {
--     callback = function(args)
--         if vim.fn.bufname(args.buf) == "" then
--             vim.bo[args.buf].modifiable = false
--             vim.bo[args.buf].readonly = true
--         end
--     end
-- })

