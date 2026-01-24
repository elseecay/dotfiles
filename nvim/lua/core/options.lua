local o = vim.opt
local utils = require("utils")

if utils.is_neovide() then
    o.background = "light"
else
    o.background = "dark"
end

o.guifont = "FiraCode Nerd Font Med:h8"

-- remove tildas in the end of buffer
o.fillchars = {eob = " ", fold = " ", foldopen = '▾', foldclose = "▸", foldsep = "│"}

-- disable persistent undo history
o.undofile = false

-- keep sign column by default
o.signcolumn = "yes"

-- mode in lualine already
o.showmode = not G.use_plugins

-- convert tabs to spaces
o.expandtab = true

-- width of line number column
o.numberwidth = 4

-- manual fold select
o.foldmethod = "manual"

-- open all folds in a new buffer
o.foldlevelstart = 99

-- limit nested folds
o.foldnestmax = 4

-- min number of lines above the cursor
o.scrolloff = 8
o.sidescrolloff = 8

-- show line numbers
o.number = true

-- do not show relative line numbers
o.relativenumber = false

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

o.smarttab = true
o.smartindent = true
o.autoindent = true

o.smartcase = true
o.ignorecase = true

o.backup = false                          -- creates a backup file
o.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
o.cmdheight = 2                           -- more space in the neovim command line for displaying messages
o.fileencoding = "utf-8"                  -- the encoding written to a file
o.ignorecase = true                       -- ignore case in search patterns
o.mouse = ""                              -- disallow the mouse to be used in neovim
o.showtabline = 0                         -- never show tabs line
o.splitbelow = true                       -- force all horizontal splits to go below current window
o.splitright = true                       -- force all vertical splits to go to the right of current window
o.swapfile = false                        -- creates a swapfile
o.termguicolors = true                    -- set term gui colors (most terminals support this)
o.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
o.cursorline = true                       -- highlight the current line
o.wrap = false                            -- display lines as one long line
o.whichwrap = ""                          -- disable wraps


-- use treesitter folding
-- if G.use_plugins then
--     o.foldmethod = "expr"
--     o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- else
--     o.foldmethod = "manual"
-- end

-- min lines to create fold
-- o.foldminlines = 5

-- fold column width
-- o.foldcolumn = "0"


-- o.guifont = "monospace:h17"               -- the font used in graphical neovim applications
-- o.completeopt = { "menuone", "noselect" } -- mostly just for cmp
-- o.conceallevel = 0                        -- so that `` is visible in markdown files
-- o.hlsearch = true                         -- highlight all matches on previous search pattern
-- o.pumheight = 10                          -- pop up menu height
-- o.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
-- o.updatetime = 300                        -- faster completion (4000ms default)
-- o.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- o.guifont = "monospace:h17"               -- the font used in graphical neovim applications
-- o.shortmess:append "c"
-- vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
