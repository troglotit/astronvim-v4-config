-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      "javascript",
      "typescript",
      "tsx",
      "elixir",
      "css",
      "scss",
      "nix"
      -- add more arguments for adding more treesitter parsers
    })
    -- opts.incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     init_selection = "<leader>sl",
    --   },
    -- }
  end,
}
