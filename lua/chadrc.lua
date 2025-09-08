-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gruvbox",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

 M.nvdash = { load_on_startup = true }
    M.ui = {
        tabufline = {
            lazyload = false
     }
}

M.ui = {
   cmp = {
     lspkind_text = true,
     style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
     format_colors = {
       lsp = true,
     },
    icons_left = true,
    icons = true,
   },

  telescope = {
    style = "bordered",
  },

  statusline = {
    theme = "minimal",
    separator_style = "default",
    order = {"mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor"},
    modules = nil,
  },

  lsp = { 
    signature = true
  },
}

return M
