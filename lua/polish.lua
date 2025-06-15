-- netrw style neotree
vim.keymap.set({ "n", "x" }, "-", function() vim.cmd ":Neotree position=current" end)
-- vim.keymap.set({ "n", "x" }, "<Enter>", "i<Enter><Escape>l")

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function(args) vim.wo.wrap = true end,
})

vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "manual"

-- local function reattch_workaround()
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.schedule(function()
--     if not vim.api.nvim_buf_is_loaded(bufnr) then return end
--     for _, client in pairs(vim.lsp.get_clients { name = "vtsls" }) do
--       vim.lsp.buf_detach_client(bufnr, client.id)
--       if client.attached_buffers[bufnr] then
--         -- if triggered, this is a bug in core
--         client.attached_buffers[bufnr] = nil
--       end
--       if not client.initialized then
--         -- if triggered, this is (possibly) a bug in core
--         client.initialized = true
--       end
--       vim.lsp.buf_attach_client(bufnr, client.id)
--       -- ensure the didOpen request in sent
--       client.notify(vim.lsp.protocol.Methods.textDocument_didOpen, {
--         textDocument = {
--           version = vim.lsp.util.buf_versions[bufnr],
--           uri = vim.uri_from_bufnr(bufnr),
--           languageId = vim.bo[bufnr].filetype,
--           text = vim.lsp._buf_get_full_text(bufnr),
--         },
--       })
--     end
--   end)
-- end
-- -- hack on vim.notify to trigger the workaround
-- -- you can also bind it to a key mapping
-- local notify = vim.notify
-- vim.notify = function(...)
--   notify(...)
--
--   local msg = select(1, ...)
--   if string.find(msg, "vtsls.*Cannot find document") == nil then return end
--   reattch_workaround()
-- end
