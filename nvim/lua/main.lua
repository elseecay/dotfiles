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
end

if utils.is_neovide() and utils.is_colorscheme_exist(G.main_light_colorscheme) then
    utils.set_light_colorscheme(G.main_light_colorscheme)
end

if not utils.is_neovide() and utils.is_colorscheme_exist(G.main_dark_colorscheme) then
    utils.set_dark_colorscheme(G.main_dark_colorscheme)
end
