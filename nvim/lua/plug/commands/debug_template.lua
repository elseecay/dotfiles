local data = 
{
    cppdbg =
[[
{
    "version": "0.2.0",
    "configurations":
    [
        {
            "name": "gdb/cpptools Launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "${workspaceFolder}/a.out",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "internalConsoleOptions": "neverOpen",
            "MIMode": "gdb",
            "setupCommands":
            [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                },
                {
                    "description": "Set Disassembly Flavor to Intel",
                    "text": "-gdb-set disassembly-flavor intel",
                    "ignoreFailures": true
                }
            ]
        }
    ]
}
]],

    debugpy =
[[
{
    "version": "0.2.0",
    "configurations":
    [
        {
            "name": "Python Debugger: Current File",
            "type": "debugpy",
            "request": "launch",
            "program": "${file}",
            "args": [],
        },
    ]
}
]]
}


local function gen_debug_configuration_template(input)
    if data[input.args] == nil then
        vim.notify("wrong argument")
        return
    end

    local fcheck = io.open(".vscode/launch.json", "r")
    if fcheck then
        vim.notify(".vscode/launch.json already exist")
        return
    end

    if not vim.fn.isdirectory(".vscode") then
        vim.fn.mkdir(".vscode")
    end

    local f = io.open(".vscode/launch.json", "w")
    if not f then
        vim.notify("cannot create file .vscode/launch.json")
        return
    end

    f:write(data[input.args])
    f:close()
end


vim.api.nvim_create_user_command("GenDebugTemplate", gen_debug_configuration_template, {nargs=1})
