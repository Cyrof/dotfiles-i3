return {
    {
        "neovim/nvim-lspconfig",
        after = "mason-lspconfig.nvim",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            -- build cmp capabilities
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
            if ok then
                capabilities = cmp_lsp.default_capabilities(capabilities)
            end
            -- on_attach
            local on_attach = function(_, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                local km = vim.keymap.set
                km("n", "gD", vim.lsp.buf.declaration, bufopts)
                km("n", "gd", vim.lsp.buf.definition, bufopts)
                km("n", "K", vim.lsp.buf.hover, bufopts)
                km("n", "gi", vim.lsp.buf.implementation, bufopts)
                km("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
                km("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
                km("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
                km("n", "gr", vim.lsp.buf.references, bufopts)
                km("n", "<leader>lf", function()
                    vim.lsp.buf.format({ async = true })
                end, bufopts)
            end

            -- Lua
            vim.lsp.config("lua_ls", {
                on_attach = on_attach,
                capabilities = capabilities,
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if path ~= vim.fn.stdpath("config")
                            and (vim.loop.fs_stat(path .. "/.luarc.json"))
                            or vim.loop.fs_stat(path .. "/.luarc.jsonc")
                        then
                            return
                        end
                    end
                    client.config.settings.Lua = vim.tbl_deep_extend("force",
                        client.config.settings.Lua or {},
                        {
                            runtime = { version = "LuaJIT" },
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME,
                                    "${3rd}/luv/library",
                                },
                            },
                        }
                    )
                end,
                settings = {
                    Lua = {
                        telemetry = { enabled = false },
                    },
                },
            })

            -- YAML
            vim.lsp.config("yamlls", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    yaml = {
                        validate = true,
                        format = { enabled = true },
                        schemas = {
                            ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.y?(a)ml",
                            ["kubernetes"] = "/*.k8s.yaml",
                        },
                    },
                },
            })

            -- Markdown
            vim.lsp.config("marksman", {
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- Python config
            vim.lsp.config("pyright", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "OpenFilesOnly"
                        }
                    }
                }
            })

            -- Web stack
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- html
            vim.lsp.config("html", {
                cmd = { "vscode-html-language-server", "--stdio" },
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "html", "templ", "twig", "hbs" },
            })

            -- css
            vim.lsp.config("cssls", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    css = { validate = true },
                    less = { validate = true },
                    scss = { validate = true },
                }
            })

            -- Emmet
            vim.lsp.config("emmet_ls", {
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = {
                    "html", "css", "sass", "scss", "less",
                    "javascriptreact", "typescriptreact",
                    "vue", "svelte", "astro", "heex", "eelixir", "templ",
                },
                init_options = { html = { options = { ["bem.enabled"] = true } } },
            })

            -- tailwind css
            vim.lsp.config("tailwindcss", {
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = {
                    "html", "css", "scss", "less",
                    "javascript", "javascriptreact",
                    "typescript", "typescriptreact",
                    "vue", "svelte", "astro", "templ",
                },
            })

            -- json (SchemaStore if available)
            do
                local schemas = nil
                local jok, schemastore = pcall(require, "schemastore")
                if jok then
                    schemas = schemastore.json.schemas()
                end
                vim.lsp.config("jsonls", {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        json = {
                            validate = { enabled = true },
                            schemas = schemas,
                        },
                    },
                })
            end

            -- eslint
            vim.lsp.config("eslint", {
                on_attach = function(client, bufnr)
                    on_attach(client, bufnr)
                    if vim.fn.exists(":EslintFixAll") == 2 then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            command = "EslintFixAll",
                        })
                    end
                end,
                capabilities = capabilities
            })

            -- stylelint (css/scss linting)
            vim.lsp.config("stylelint_lsp", {
                on_attach = on_attach,
                capabilities = capabilities,
            })

            -- map tmpl to html
            vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
                pattern = "*.tmpl",
                callback = function()
                    vim.bo.filetype = "html"
                end,
            })

            -- diagnostics & signs
            vim.diagnostic.config({
                virtual_text     = { prefix = "●", source = "if_many" },
                float            = { border = "rounded", source = "always" },
                signs            = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.INFO] = "",
                        [vim.diagnostic.severity.HINT] = "",
                    },
                },
                underline        = true,
                update_in_insert = false,
                severity_sort    = true,
            })
        end,
    },
}
