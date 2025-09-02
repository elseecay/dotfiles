-- :help options
local o = vim.opt

-- remove tildas in the end of buffer
o.fillchars = "eob: "

o.number = true
o.relativenumber = false

-- width of line number column
o.numberwidth = 4

-- keep sign column by default
o.signcolumn = "yes"

-- do not show mode with plugins, it is in lualine
o.showmode = not G.use_plugins

-- convert tabs to spaces
o.expandtab = true

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

o.smarttab = true
o.smartindent = true
o.autoindent = true

-- persistent undo history
o.undofile = false

o.smartcase = true
o.ignorecase = true

-- min number of lines above the cursor
o.scrolloff = 8
o.sidescrolloff = 8

o.backup = false                          -- creates a backup file
o.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
o.cmdheight = 2                           -- more space in the neovim command line for displaying messages
o.fileencoding = "utf-8"                  -- the encoding written to a file
o.ignorecase = true                       -- ignore case in search patterns
o.mouse = "a"                             -- allow the mouse to be used in neovim
o.showtabline = 2                         -- always show tabs line
o.splitbelow = true                       -- force all horizontal splits to go below current window
o.splitright = true                       -- force all vertical splits to go to the right of current window
o.swapfile = false                        -- creates a swapfile
o.termguicolors = true                    -- set term gui colors (most terminals support this)
o.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
o.cursorline = true                       -- highlight the current line
o.wrap = false                            -- display lines as one long line

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
