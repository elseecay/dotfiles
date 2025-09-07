local utils = require("utils")
local wk = require("which-key")
local telescope_builtin = require("telescope.builtin")

local function find_files_in_nvim_config()
    telescope_builtin.find_files({cwd = vim.fn.stdpath("config")})
end

wk.add({{"<Leader>f", group = "Find", mode = "n"}})
utils.keymap("n", "<Leader>ff", telescope_builtin.find_files, "Files")
utils.keymap("n", "<Leader>fc", find_files_in_nvim_config, "Config files")
utils.keymap("n", "<Leader>fo", telescope_builtin.oldfiles, "Previously open files")
utils.keymap("n", "<Leader>fg", telescope_builtin.live_grep, "Live grep")
utils.keymap("n", "<Leader>ft", function() telescope_builtin.live_grep({glob_pattern = vim.fn.expand("%")}) end, "Live grep current file")
utils.keymap("n", "<Leader>fh", telescope_builtin.help_tags, "Help tags")
utils.keymap("n", "<Leader>fs", telescope_builtin.grep_string, "String under cursor")
utils.keymap("n", "<Leader>fr", telescope_builtin.lsp_references, "References under cursor")
utils.keymap("n", "<Leader>fs", telescope_builtin.lsp_workspace_symbols, "Workspace symbols")

wk.add({{"<Leader>fv", group = "Git", mode = "n"}})
utils.keymap("n", "<Leader>fvc", telescope_builtin.git_commits, "Commits")
utils.keymap("n", "<Leader>fvs", telescope_builtin.git_status, "Status")
