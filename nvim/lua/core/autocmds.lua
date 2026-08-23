local utils = require("utils")

local ALWAYS_DARK = 
{
    "habamax", "sorbet",
    "neon",
    "lytmode",
    "oxocarbon",
    "tokyonight-moon", "tokyonight-night", "tokyonight-storm",
    "bamboo-multiplex", "bamboo-vulgaris",
    "nightfox", "carbonfox", "duskfox", "nordfox", "terafox",
    "sonokai",
    "poimandres",
    "oldworld",
}

local ALWAYS_LIGHT =
{
    "shine",
    "newpaper",
    "tokyonight-day",
    "bamboo-light",
    "dayfox", "dawnfox",
    "melange"
}

local function set_background_by_colorscheme(name)
    local bg = nil
    if utils.array_find(ALWAYS_DARK, name:lower()) ~= nil then
        bg = "dark"
    end
    if utils.array_find(ALWAYS_LIGHT, name:lower()) ~= nil then
        bg = "light"
    end
    if bg ~= nil then
        vim.opt.background = bg
        vim.notify("Background: " .. bg)
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


vim.api.nvim_create_autocmd("FileType",
{
    pattern = "*",
    callback = function(args)
        local buf = args.buf
        local name = vim.api.nvim_buf_get_name(buf)
        local ok, stats = pcall(vim.loop.fs_stat, name)
        if ok and stats and stats.size > 200 * 1024 then
            return
        end
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang then
            pcall(vim.treesitter.start, buf, lang)
        end
    end
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

