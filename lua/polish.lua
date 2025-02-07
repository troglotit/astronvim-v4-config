-- netrw style neotree
vim.keymap.set({ "n", "x" }, "-", function() vim.cmd ":Neotree position=current" end) 
-- vim.keymap.set({ "n", "x" }, "<Enter>", "i<Enter><Escape>l")

 vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function(args)
      vim.wo.wrap = true
  end,
})
