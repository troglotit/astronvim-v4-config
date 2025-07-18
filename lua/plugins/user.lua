-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    dependencies = {
      "tpope/vim-repeat",
    },
    specs = {
      {
        "catppuccin",
        optional = true,
        ---@type CatppuccinOptions
        opts = { integrations = { leap = true } },
      },
    },
    config = function()
      local leap = require "leap"
      vim.keymap.set({ "n", "x" }, "<leader>j", function()
        local target_windows = vim.tbl_filter(
          function(win) return vim.api.nvim_win_get_config(win).focusable end,
          vim.api.nvim_tabpage_list_wins(0)
        )
        leap.leap {
          target_windows = target_windows,
          inclusive_op = false,
        }
      end)
    end,
  },
  {
    -- "NeogitOrg/neogit",
    "fang2hou/neogit",
    -- TODO: move after https://github.com/NeogitOrg/neogit/pull/1654 is merged
    branch = "feature/snacks-integration",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    event = "User AstroGitFile",
    keys = {
      { "<leader>gn", "<cmd>Neogit<CR>", desc = "Open Neogit Tab Page" },
    },
    config = function()
      require("neogit").setup {
        mappings = {
          -- status = {
          -- },
          popup = {
            ["O"] = "ResetPopup",
            ["F"] = "PullPopup",
            ["p"] = "PushPopup",
          },
        },
        sections = {
          stashes = {
            folded = false,
            hidden = false,
          },
          recent = {
            folded = false,
            hidden = false,
          },
        },
        integrations = {
          diffview = true,
          telescope = false,
          snacks = true,
        },
      }
    end,
  },

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  -- {
  --   "goolord/alpha-nvim",
  --   opts = function(_, opts)
  --     -- customize the dashboard header
  --     opts.section.header.val = {
  --       " █████  ███████ ████████ ██████   ██████",
  --       "██   ██ ██         ██    ██   ██ ██    ██",
  --       "███████ ███████    ██    ██████  ██    ██",
  --       "██   ██      ██    ██    ██   ██ ██    ██",
  --       "██   ██ ███████    ██    ██   ██  ██████",
  --       " ",
  --       "    ███    ██ ██    ██ ██ ███    ███",
  --       "    ████   ██ ██    ██ ██ ████  ████",
  --       "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
  --       "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
  --       "    ██   ████   ████   ██ ██      ██",
  --     }
  --     return opts
  --   end,
  -- },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = function(_, opts)
      opts.mode = "topline"
      opts.multiline_threshold = 1
      return opts
    end,
  },
  -- {
  --     {
  --       "supermaven-inc/supermaven-nvim",
  --       config = function()
  --         require("supermaven-nvim").setup({})
  --       end,
  --     },
  -- }
  {
    "hat0uma/csvview.nvim",
    config = function() require("csvview").setup() end,
  },
  {
    { "vuki656/package-info.nvim", enabled = false },
  },
  {
    { "kevinhwang91/nvim-ufo", enabled = true },
  },
}
