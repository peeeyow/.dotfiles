-- don't auto remove highlight on key press other than hlsearch navigation
vim.on_key(function() end, vim.api.nvim_get_namespaces()["auto_hlsearch"])
