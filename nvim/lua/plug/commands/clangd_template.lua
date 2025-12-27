local function gen_clangd_template()
    local yaml_content =
    {
        "CompileFlags:",
        "  Add: [",
        "    '-std=c++20',",
        "    '-Wall',",
        "    '-Wextra',", 
        "    '-Wpedantic',",
        "    '-Wno-unused-parameter',",
        "  ]",
        "  Remove: [",
        "    '-fno-exceptions',",
        "  ]",
        "",
        "Diagnostics:",
        "  UnusedIncludes: Strict",
        "",
        "Index:",
        "  Background: Build",
        "",
        "Hover:",
        "  ShowAKA: Yes",
        "",
        "Completion:",
        "  Enable: Yes",
        "  DetailedLabel: Yes",
        "",
        "HeaderInsertion: Never",
    }

    local content = table.concat(yaml_content, "\n")
    local file = io.open(".clangd", "w")
    if file then
        file:write(content)
        file:close()
        vim.notify("✅ Generated basic .clangd template")
    else
        vim.notify("❌ Error: Could not create .clangd file")
    end
end


vim.api.nvim_create_user_command("ClangdTemplate", gen_clangd_template, {desc = "Generate .clangd template"})
