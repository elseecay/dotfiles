local utils = require("utils")

require "core.options"
require "core.keymaps"

if utils.is_neovide() then
    require("core.neovide")
end
