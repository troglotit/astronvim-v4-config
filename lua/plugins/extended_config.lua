return {
  {
    "nvim-telescope/telescope.nvim",
    -- the first parameter is the plugin specification
    -- the second is the table of options as set up in Lazy with the `opts` key
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      opts.defaults.dynamic_preview_title = true
      require "astronvim.plugins.configs.telescope"(plugin, opts)
    end,
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   config = function(plugin, opts)
  --     opts.window.auto_expand_width = true
  --     require 'astronvim.plugins.configs.neo-tree'(plugin, opts)
  --   end,
  -- },
}
