
-- credits to original theme https://github.com/ayu-theme/ayu-vim (dark)
-- This is just a modified version of it

local M = {}

M.base_30 = {
  white = "#FFFFFF",
  darker_black = "#050505",
  black = "#101010", --  nvim bg
  black2 = "#1E1E1E",
  one_bg = "#262626",
  one_bg2 = "#2E2E2E",
  one_bg3 = "#353535",
  grey = "#3D3D3D",
  grey_fg = "#474747",
  grey_fg2 = "#505359",
  light_grey = "#5E5E5E",
  red = "#F07178",
  baby_pink = "#ff949b",
  pink = "#ff8087",
  line = "#2E2E2E", -- for lines like vertsplit
  green = "#AAD84C",
  vibrant_green = "#b9e75b",
  blue = "#36A3D9",
  nord_blue = "#43b0e6",
  yellow = "#E7C547",
  sun = "#f0df8a",
  purple = "#c79bf4",
  dark_purple = "#A37ACC",
  teal = "#74c5aa",
  orange = "#ffa455",
  cyan = "#95E6CB",
  statusline_bg = "#1C1C1C",
  lightbg = "#2E2E2E",
  pmenu_bg = "#ff9445",
  folder_bg = "#98a3af",
}

M.base_16 = {
  base00 = "#101010",
  base01 = "#262626",
  base02 = "#2E2E2E",
  base03 = "#353535",
  base04 = "#3D4046",
  base05 = "#c9c9c9",
  base06 = "#e6e6e6",
  base07 = "#d9d9d9",
  base08 = "#FAFAFA",
  base09 = "#FFEE99",
  base0A = "#56c3f9",
  base0B = "#AAD84C",
  base0C = "#FFB454",
  base0D = "#F07174",
  base0E = "#FFB454",
  base0F = "#CBA6F7",
}
M.polish_hl = {
  treesitter = {
    luaTSField = { fg = M.base_16.base0D },
    ["@tag.delimiter"] = { fg = M.base_30.cyan },
    ["@function"] = { fg = M.base_30.orange },
    ["@variable.parameter"] = { fg = M.base_16.base0F },
    ["@constructor"] = { fg = M.base_16.base0A },
    ["@tag.attribute"] = { fg = M.base_30.orange },
  },
}

M = require("base46").override_theme(M, "shiztheme")

M.type = "dark"

return M
