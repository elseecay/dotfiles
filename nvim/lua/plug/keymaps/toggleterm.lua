local utils = require("utils")

utils.keymap_command("n", "<C-\\>", "ToggleTerm", "Toggle terminal")
utils.keymap_command("t", "<C-\\>", "ToggleTerm", "Toggle terminal")

utils.keymap("t", "<Esc>", "<C-\\><C-n>", "Go to normal mode in terminal")

