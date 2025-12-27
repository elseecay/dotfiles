require("plug.settings.lsp_cpp")
require("plug.settings.lsp_cmake")
require("plug.settings.lsp_python")


vim.lsp.config("lua_ls", {})
vim.lsp.config("rust-analyzer", {})
vim.lsp.enable({"lua_ls", "rust-analyzer"})
