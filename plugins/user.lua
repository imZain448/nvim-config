return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "xiyaowong/transparent.nvim",
    event = "BufEnter",
    config = function ()
      require("transparent").setup({ -- Optional, you don't have to run setup.
    groups = { -- table: default groups
      'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
      'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
      'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
      'SignColumn', 'CursorLineNr', 'EndOfBuffer',
    },
    extra_groups = {}, -- table: additional groups that should be cleared
    exclude_groups = {}, -- table: groups you don't want to clear
    })
    end

  },
    {
    "folke/styler.nvim",
    event = "VeryLazy",
    config = function()
      require("styler").setup {
        themes = {
          markdown = { colorscheme = "gruvbox" },
          help = { colorscheme = "gruvbox" },
        },
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      local tokyonight = require "tokyonight"
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    config = function()
      require("gruvbox").setup()
    end,
  },
  {
  "wfxr/minimap.vim",
  event = "BufEnter",
  cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
  keys = {
    { "<leader>um", "<cmd>MinimapToggle<CR>", desc = "Toggle minimap", mode = { "n" } },
  },
  init = function()
    vim.g.minimap_width = 10
    vim.g.minimap_auto_start = 1
    vim.g.minimap_auto_start_win_enter = 1
    vim.g.minimap_block_filetypes = {
      "fugitive",
      "nerdtree",
      "tagbar",
      "fzf",
      "qf",
      "netrw",
      "NvimTree",
      "lazy",
      "mason",
      "prompt",
      "TelescopePrompt",
      "noice",
      "notify",
      "neo-tree",
    }
    vim.g.minimap_highlight_search = 1
    vim.g.minimap_git_colors = 1
  end,
}
}
