return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason.nvim",
        },
        config = function()
            -- build cmp capabilities 
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
            if ok then
                capabilities = cmp_lsp.default_capabilities(capabilities)
            end
            
            -- on_attach
            local on_attach = function(client, bufnr)
                local bufopts = { noremap=true, silent=true, buffer=buffer }
                local km = vim.keymap.set
                 local km = vim.keymap.set
                km("n","gD", vim.lsp.buf.declaration, bufopts)
                km("n","gd", vim.lsp.buf.definition,  bufopts)
                km("n","K",  vim.lsp.buf.hover,       bufopts)
                km("n","gi", vim.lsp.buf.implementation, bufopts)
                km("n","<C-k>", vim.lsp.buf.signature_help, bufopts)
                km("n","<leader>rn", vim.lsp.buf.rename,      bufopts)
                km("n","<leader>ca", vim.lsp.buf.code_action, bufopts)
                km("n","gr", vim.lsp.buf.references,          bufopts)
                km("n","<leader>lf", function()
                  vim.lsp.buf.format({ async = true })
                end, bufopts)
            end
            
            -- handler for all servers, with lua_ls override
            require("mason-lspconfig").setup_handlers({
                function(server)
                    require("lspconfig")[server].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                diagnostics = { globals = { "vim" } },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                    checkThirdParty = false,
                                },
                                telemetry = { enable = false },
                            },
                        },
                    })
                end,
            })
            
            -- diagnostics & signs 
              vim.diagnostic.config({
                virtual_text     = { prefix = "●", source = "if_many" },
                float            = { border = "rounded", source = "always" },
                signs            = true,
                underline        = true,
                update_in_insert = false,
                severity_sort    = true,
              })

              for type, icon in pairs({ Error = "", Warn = "", Info = "", Hint = "" }) do
                vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type })
              end
        end,
    },
}
