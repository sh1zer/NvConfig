return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },


  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    opts = {},
  },
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        {"nvim-lua/plenary.nvim"},

        -- optional picker via telescope
        {"nvim-telescope/telescope.nvim"},
        -- optional picker via fzf-lua
        {"ibhagwan/fzf-lua"},
    },
    event = "LspAttach",
    opts = {},
  },

{
	"Fildo7525/pretty_hover",
	event = "LspAttach",
	opts = {
      border = "single",
    }
},
-- {
--   "ray-x/lsp_signature.nvim",
--   event = "LspAttach",
--   opts = {
--     handler_opts = {
--       border = "rounded"
--     }
--   },
-- },
{
  "folke/trouble.nvim",
  opts = {
      focus=true,
      auto_close=true,
      modes = {
        preview_float = {
          mode = "diagnostics",
          preview = {
            type = "float",
            relative = "editor",
            border = "rounded",
            title = "Preview",
            title_pos = "center",
            position = { 0, -2 },
            size = { width = 0.3, height = 0.3 },
            zindex = 200,
          },
        },
      },
    }, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",

  keys = {
    -- {
    --   "<leader>xx",
    --   "<cmd>Trouble diagnostics toggle<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
    -- {
    --   "<leader>xX",
    --   "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    --   desc = "Buffer Diagnostics (Trouble)",
    -- },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    -- {
    --   "<leader>xL",
    --   "<cmd>Trouble loclist toggle<cr>",
    --   desc = "Location List (Trouble)",
    -- },
    -- {
    --   "<leader>xQ",
    --   "<cmd>Trouble qflist toggle<cr>",
    --   desc = "Quickfix List (Trouble)",
    -- },
  },
},
    {
    "ggandor/leap.nvim",
    dependencies = {
    },
    lazy = false,
    opts = {},
  },
-- {
--     "kdheepak/lazygit.nvim",
--     lazy = true,
--     cmd = {
--         "LazyGit",
--         "LazyGitConfig",
--         "LazyGitCurrentFile",
--         "LazyGitFilter",
--         "LazyGitFilterCurrentFile",
--     },
--     -- optional for floating window border decoration
--     dependencies = {
--         "nvim-lua/plenary.nvim",
--     },
--     -- setting the keybinding for LazyGit with 'keys' is recommended in
--     -- order to load the plugin when the command is run for the first time
--     keys = {
--         { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
--     }
-- },
  {
  "folke/snacks.nvim",
  priority=1000,
  lazy=false,
  opts = {
    picker = {
      config = function(opts)
        local theme = require "themes.shiztheme"

        -- 1. DEFINE ALL HIGHLIGHTS
        vim.api.nvim_set_hl(0, "SnacksPickerNormal", { bg = theme.base_30.grey, fg = theme.base_16.base05 })
        vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = theme.base_30.grey })
        vim.api.nvim_set_hl(0, "SnacksPickerSelection", { bg = theme.base_30.one_bg2, bold = true })
        vim.api.nvim_set_hl(0, "SnacksPickerSearch", { bg = theme.base_30.one_bg3, fg = theme.base_30.yellow })
        vim.api.nvim_set_hl(0, "SnacksInputPrompt", { fg = theme.base_30.blue, bold = true })
        -- Title Highlights
        -- vim.api.nvim_set_hl(0, "SnacksPickerTitle", { fg = theme.base_30.blue, bold = true }) -- Default


        -- 3. CONSTRUCT WINHL MAPPINGS
        local base_hl = "Normal:SnacksPickerNormal,FloatBorder:SnacksPickerBorder,CursorLine:SnacksPickerSelection,Search:SnacksPickerSearch"

        -- 4. APPLY HIGHLIGHTS AND KEYMAPS
        local custom_win_opts = {
          input = {
            winhl = base_hl,
            keys = {
              ["<Tab>"] = { "list_down", mode = { "i", "n" } },
              ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
          preview = {
            winhl = base_hl,
          },
        }
        opts.win = vim.tbl_deep_extend("force", opts.win or {}, custom_win_opts)

        opts.layout = {
          backdrop = false,
          layout = {
            box = "horizontal",
            width = 0.3,
            height = 0.4,
            {
              box = "vertical",
              border = "solid",
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
          },
        }
        opts.matcher = { frecency = true, sort_empty = true }
        -- opts.auto_confirm = true
        -- opts.icons = { files = { enabled = true }, git = { enabled = true } }
        -- opts.prompt = " "

        return opts
      end,
    },
    explorer = {},
    notifier = {},
    lazygit = {},
    quickfile = {},
  },
  keys = {
          { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    }
}
}
