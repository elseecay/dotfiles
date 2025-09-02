local M = {}

vim.cmd("silent! delmarks A-Z")

vim.fn.sign_define("Bookmark", {text="🏷️", texthl="", linehl="", numhl=""})

local bookmark_sign_id_map = {}

local function get_cur_pos_mark_index(marklist)
    local current_file_abspath = vim.fn.expand("%:p")
    local current_file_line = vim.fn.line(".")
    for i = 1, #marklist do
        local f = vim.fn.expand(marklist[i]["file"])
        local l = marklist[i]["pos"][2]
        if f == current_file_abspath and l == current_file_line then
            return i
        end
    end
    return 0
end

local function get_free_global_mark_letter(marklist)
    local in_use = {}
    for i = 1, #marklist do
        local m = string.sub(marklist[i]["mark"], 2, 2)
        in_use[m] = true
    end
    for i = string.byte("A"), string.byte("Z") do
        local c = string.char(i)
        if in_use[c] == nil then
            return c
        end
    end
    return nil
end

local function unplace_bookmark_sign(letter)
    local sign_id = bookmark_sign_id_map[letter]
    if sign_id ~= nil then
        vim.fn.sign_unplace("BookmarkGroup", {id = sign_id})
    end
end

local function place_bookmark_sign(letter)
    unplace_bookmark_sign(letter)
    local bufnr = vim.api.nvim_get_current_buf()
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local sign_id = vim.fn.sign_place(0, "BookmarkGroup", "Bookmark", bufnr, {lnum = current_line})
    bookmark_sign_id_map[letter] = sign_id
end

function M.jump_to_next_global_letter_bookmark()
    local marklist = vim.fn.getmarklist()
    local cur_pos_mark_index = get_cur_pos_mark_index(marklist)
    for i = cur_pos_mark_index + 1, cur_pos_mark_index + #marklist do
        local index = i
        if index > #marklist then
            index = index - #marklist
        end
        local m = string.sub(marklist[index]["mark"], 2, 2)
        local b = string.byte(m)
        if b >= string.byte("A") and b <= string.byte("Z") then
            local success, _ = pcall(vim.api.nvim_command, "'" .. m)
            if not success then
                unplace_bookmark_sign(m)
                vim.cmd("silent! delmarks " .. m)
            else
                vim.notify("Bookmark: " .. m, vim.log.levels.INFO)
                return
            end
        end
    end
    vim.notify("No bookmarks!", vim.log.levels.INFO)
end

function M.jump_to_prev_global_letter_bookmark()
    local marklist = vim.fn.getmarklist()
    local cur_pos_mark_index = get_cur_pos_mark_index(marklist)
    for i = cur_pos_mark_index + #marklist - 1, cur_pos_mark_index, -1 do
        local index = i
        if index > #marklist then
            index = index - #marklist
        end
        local m = string.sub(marklist[index]["mark"], 2, 2)
        local b = string.byte(m)
        if b >= string.byte("A") and b <= string.byte("Z") then
            local success, _ = pcall(vim.api.nvim_command, "'" .. m)
            if not success then
                unplace_bookmark_sign(m)
                vim.cmd("silent! delmarks " .. m)
            else
                vim.notify("Bookmark: " .. m, vim.log.levels.INFO)
                return
            end
        end
    end
    vim.notify("No bookmarks!", vim.log.levels.INFO)
end

function M.toggle_global_letter_bookmark()
    local marklist = vim.fn.getmarklist()
    local cur_pos_mark_index = get_cur_pos_mark_index(marklist)
    if cur_pos_mark_index == 0 then
        local free = get_free_global_mark_letter(marklist)
        if free == nil then
            vim.notify("All bookmark letters are in use")
            return
        end
        vim.notify("Bookmark: " .. free, vim.log.levels.INFO)
        vim.cmd("mark " .. free)
        place_bookmark_sign(free)
    else
        local m = string.sub(marklist[cur_pos_mark_index]["mark"], 2, 2)
        vim.notify("Bookmark del: " .. m)
        vim.cmd("delm " .. m)
        unplace_bookmark_sign(m)
    end
end

return M

