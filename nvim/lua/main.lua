require("g")

-- disable netrw file manager
if G.use_plugins then 
    vim.g.loaded_netrwPlugin = 1
    vim.g.loaded_netrw = 1
end

local utils = require("utils")
require("core.init")

if utils.is_neovide() then
    utils.colorscheme(G.default_light_colorscheme)
else
    utils.colorscheme(G.default_dark_colorscheme)
end

if G.use_plugins then 
    require("plug.init")
    if utils.is_neovide() then
        utils.colorscheme(G.main_light_colorscheme)
    else
        utils.colorscheme(G.main_dark_colorscheme)
    end
end

local project_path = vim.fn.getcwd() .. "/.nvim/project.lua"
if vim.fn.filereadable(project_path) ~= 0 then
    dofile(project_path)
end

local file_argument_passed = #vim.fn.argv() > 0
if G.use_plugins and not file_argument_passed then
    vim.cmd("NvimTreeOpen")
end

