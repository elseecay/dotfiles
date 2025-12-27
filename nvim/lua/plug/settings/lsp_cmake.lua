local function diagnostic_only_errors(err, result, ctx, config)
    if result and result.diagnostics then
        local errors = {}
        for _, d in ipairs(result.diagnostics) do
            if d.severity == vim.lsp.protocol.DiagnosticSeverity.Error then table.insert(errors, d) end
        end
        result.diagnostics = errors
    end
    vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx, config)
end


vim.lsp.config("neocmake",
{
    handlers =
    {
        ["textDocument/publishDiagnostics"] = diagnostic_only_errors
    }
})


vim.lsp.enable({"neocmake"})
