require("g")

local utils = require("utils")

-- disable netrw file manager
if G.use_plugins then 
    vim.g.loaded_netrwPlugin = 1
    vim.g.loaded_netrw = 1
end

if utils.is_neovide() then
    utils.set_light_colorscheme(G.default_light_colorscheme)
else
    utils.set_dark_colorscheme(G.default_dark_colorscheme)
end

require("core.init")
if G.use_plugins then 
    require("plug.init")
    if utils.is_neovide() then
        utils.set_light_colorscheme(G.main_light_colorscheme)
    else
        utils.set_dark_colorscheme(G.main_dark_colorscheme)
    end
end

if vim.fn.filereadable(vim.fn.getcwd() .. "/.nvim/project.lua") ~= 0 then
    dofile(vim.fn.getcwd() .. "/.nvim/project.lua")
end

if G.use_plugins then
    vim.cmd("NvimTreeOpen")
end

