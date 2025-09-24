return
{
    {
        "farmergreg/vim-lastplace",
        init = function()
            vim.g.lastplace_ignore = "gitcommit,gitrebase,hgcommit,svn,xxd"
            vim.g.lastplace_ignore_buftype = "help,nofile,quickfix"
            -- vim.g.lastplace_open_folds = 0
        end
    }
}

