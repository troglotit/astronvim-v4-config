-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.astro" },

  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },

  { import = "astrocommunity.colorscheme.catppuccin", enable = false },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim", enable = true },

  { import = "astrocommunity.git.git-blame-nvim" },
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },

  { import = "astrocommunity.editing-support.neogen" },

  -- { import = "astrocommunity.search.nvim-spectre" },

  { import = "astrocommunity.fuzzy-finder.snacks-picker" },

  { import = "astrocommunity.completion.blink-cmp" },
  -- import/override with your plugins folder[sd]
}
