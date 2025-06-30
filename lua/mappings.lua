require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>ln", ":set invnumber invrelativenumber<CR>")
-- map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>greet", ":lua require\"greeter\".test()<CR>")
vim.keymap.set('n', '<space>ca', function()
    vim.lsp.buf.code_action({apply=true}) end, bufopts)

vim.keymap.set('v', '<space>ca', ":lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("n", "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

-- vim.keymap.set("n", "K", ":lua require(\"pretty_hover\").hover()<CR>")

vim.keymap.set("n", "K", function() require("pretty_hover").hover() end )
require('leap').set_default_mappings()
