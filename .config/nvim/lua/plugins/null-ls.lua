local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.code_actions.shellcheck,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    -- vim.lsp.buf.formatting_sync()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})

-- Just a test
local no_really = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "markdown", "md", "text" },
    generator = {
        fn = function(params)
            local diagnostics = {}
            -- sources have access to a params object
            -- containing info about the current file and editor state
            for i, line in ipairs(params.content) do
                local col, end_col = line:find("really")
                if col and end_col then
                    -- null-ls fills in undefined positions
                    -- and converts source diagnostics into the required format
                    table.insert(diagnostics, {
                        row = i,
                        col = col,
                        end_col = end_col + 1,
                        source = "no-really",
                        message = "Don't use 'really!'",
                        severity = vim.diagnostic.severity.WARN,
                    })
                end
            end
            return diagnostics
        end,
    },
}

local no_locals = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "terraform", "tf" },
    generator = {
        fn = function(params)
            local diagnostics = {}
            -- sources have access to a params object
            -- containing info about the current file and editor state
            for i, line in ipairs(params.content) do
                local col, end_col = line:find("local%.")
                if col and end_col then
                    -- null-ls fills in undefined positions
                    -- and converts source diagnostics into the required format
                    table.insert(diagnostics, {
                        row = i,
                        col = col,
                        end_col = end_col + 1,
                        source = "no-locals",
                        message = "Convert locals to vars",
                        severity = vim.diagnostic.severity.WARN,
                    })
                end
            end
            return diagnostics
        end,
    },
}

local check_modules = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "terraform", "tf" },
    generator = {
        fn = function(params)
            local diagnostics = {}
            -- sources have access to a params object
            -- containing info about the current file and editor state
            for i, line in ipairs(params.content) do
                local col, end_col = line:find("module%.")
                if col and end_col then
                    -- null-ls fills in undefined positions
                    -- and converts source diagnostics into the required format
                    table.insert(diagnostics, {
                        row = i,
                        col = col,
                        end_col = end_col + 1,
                        source = "check-modules",
                        message = "Check modules are still correct",
                        severity = vim.diagnostic.severity.INFO,
                    })
                end
            end
            return diagnostics
        end,
    },
}

local check_data = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "terraform", "tf" },
    generator = {
        fn = function(params)
            local diagnostics = {}
            -- sources have access to a params object
            -- containing info about the current file and editor state
            for i, line in ipairs(params.content) do
                local col, end_col = line:find("data%.")
                if col and end_col then
                    -- null-ls fills in undefined positions
                    -- and converts source diagnostics into the required format
                    table.insert(diagnostics, {
                        row = i,
                        col = col,
                        end_col = end_col + 1,
                        source = "check-data",
                        message = "Check data is still correct",
                        severity = vim.diagnostic.severity.INFO,
                    })
                end
            end
            return diagnostics
        end,
    },
}

-- null_ls.register(no_really)
-- null_ls.register(no_locals)
-- null_ls.register(check_modules)
-- null_ls.register(check_data)
