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
  {
  "folke/snacks.nvim",
  priority=1000,
  lazy=false,
  opts = {
    picker = {
      layout = {
        backdrop = true,
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
      },
      config = function(opts)
        local theme = require "themes.shiztheme"

        -- vim.api.nvim_set_hl(0, "SnacksPicker", { bg = theme.base_30.grey, fg = theme.base_30.green })
        vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { bg = theme.base_30.grey})
        vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = theme.base_30.cyan })

        local custom_win_opts = {
          input = {
            keys = {
              ["<Tab>"] = { "list_down", mode = { "i", "n" } },
              ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        }
        opts.win = vim.tbl_deep_extend("force", opts.win or {}, custom_win_opts)

        opts.matcher = { frecency = true, sort_empty = true }
        -- opts.auto_confirm = true

        return opts
      end,
    },
    notifier = {},
    lazygit = {
      configure = true,
      -- extra configuration for lazygit that will be merged with the default
      -- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
      -- you need to double quote it: `"\"test\""`
      config = {
        os = { editPreset = "nvim-remote" },
        gui = {
          nerdFontsVersion = "3",
        },
      },
      theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
      -- Theme for lazygit
      theme = {
        [241] = { fg = "Special" },
        activeBorderColor = { fg = "Special", bold = true },
        cherryPickedBgColor = { fg = "Identifier" },
        cherryPickedFgColor = { fg = "Function" },
        defaultFgColor = { fg = "Normal" },
        inactiveBorderColor = { fg = "MatchParen" },
        optionsTextColor = { fg = "Function" },
        -- searchingActiveBorderColor = { fg = "MatchParen", bold = true },
        selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
        unstagedChangesColor = { fg = "DiagnosticError" },
      },
      win = {
        style = "lazygit",
      },
    },
    quickfile = {},
  },
  keys = {
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
  }
},
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    dir = '~/key_inspector.nvim',
    name = 'key_inspector.nvim',
  },
}
