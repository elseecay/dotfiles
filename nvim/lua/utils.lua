local M = {}

function M.keymap(mode, lhs, rhs, desc, additional, use_set_keymap)
    local opts = {noremap = true, silent = true, desc = desc or "nodesc"}
    if additional ~= nil then
        opts = vim.tbl_extend("force", opts, additional)
    end
    if use_set_keymap then
        vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    else
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

function M.keymap_command(mode, lhs, command, desc)
    M.keymap(mode, lhs, function() vim.cmd(command) end, desc)
end

function M.delkeymap(mode, lhs, buffer)
    local opts = {buffer = buffer}
    vim.keymap.del(mode, lhs, opts)
end

function M.colorscheme(name)
    vim.cmd("colorscheme" .. " " .. name)
end

function M.input(prompt, default, completion)
    local result = nil
    vim.ui.input({prompt = prompt, completion = completion, default = default}, function(r) result = r end)
    return result
end

function M.is_neovide()
    return vim.g.neovide
end

function M.is_colorscheme_exist(name)
    local colorscheme_path = vim.api.nvim_get_runtime_file("colors/" .. name .. ".vim", false)
    return colorscheme_path ~= ""
end

function M.set_light_colorscheme(name)
    vim.opt.background = "light"
    vim.cmd("colorscheme" .. " " .. name)
end

function M.set_dark_colorscheme(name)
    vim.opt.background = "dark"
    vim.cmd("colorscheme" .. " " .. name)
end

function M.table_tostring(val, name, skipnewlines, depth)
    skipnewlines = skipnewlines or false
    depth = depth or 0
    local tmp = string.rep(" ", depth)
    if name then tmp = tmp .. name .. " = " end
    if type(val) == "table" then
        tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")
        for k, v in pairs(val) do
            tmp =  tmp .. M.table_tostring(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
        end
        tmp = tmp .. string.rep(" ", depth) .. "}"
    elseif type(val) == "number" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    elseif type(val) == "boolean" then
        tmp = tmp .. (val and "true" or "false")
    else
        tmp = tmp .. "\"[datatype:" .. type(val) .. "]\""
    end
    return tmp
end

function M.fprint(message)
    local file, err = io.open("fprint.txt", "a")
    if not file then
        vim.notify("fprint - cannot open file" .. ", " .. err)
        return
    end
    if type(message) == "table" then
        message = M.table_tostring(message)
    end
    file:write(tostring(message) .. "\n")
    file:close()
end

local f = io.open("fprint.txt", "r")
if f then
    f:close()
    os.remove("fprint.txt")
end

return M
