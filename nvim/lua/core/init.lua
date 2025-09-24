local utils = require("utils")

if utils.is_neovide() then
    require("core.neovide")
end

require("core.options")
require("core.keymaps")
require("core.autocmds")

