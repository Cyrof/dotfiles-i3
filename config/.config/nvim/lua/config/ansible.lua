vim.filetype.add({
    pattern = {
        [".*/ansible%-configs/.*%.ya?ml"]  = "yaml.ansible",
        [".*/playbooks/.*%.ya?ml"]         = "yaml.ansible",
        [".*/roles/.*/tasks/.*%.ya?ml"]    = "yaml.ansible",
        [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
        [".*/host_vars/.*%.ya?ml"]         = "yaml.ansible",
        [".*/group_vars/.*%.ya?ml"]        = "yaml.ansible",
    },
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.yml", "*.yaml" },
    callback = function(args)
        if vim.bo[args.buf].filetype ~= "yaml.ansible" then return end

        local file = vim.api.nvim_buf_get_name(args.buf)
        if file == "" then return end

        vim.system({ "ansible-lint", file }, { text = true }, function(res)
            vim.schedule(function()
                vim.cmd("checktime " .. args.buf)

                if res.code == 0 then return end

                local out = ((res.stderr and res.stderr ~= "") and res.stderr) or (res.stdout or "")

                if out:match("Modified%s+%d+%s+file") then
                    vim.notify(
                        "ansible-lint applied fixes, but syntax-check still fails (open file to fix playbook structure).",
                        vim.log.levels.WARN)
                    return
                end

                vim.notify(("ansible-lint --fix failed:\n%s"):format(out), vim.log.levels.WARN)
            end)
        end)
    end,
})
