vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map_n = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = desc })
end

local map_v = function(keys, func)
	vim.keymap.set("v", keys, func, {})
end

local map_x = function(keys, func)
	vim.keymap.set("x", keys, func, {})
end

local map_i = function(keys, func)
	vim.keymap.set("i", keys, func, {})
end

map_n("<leader>pv", vim.cmd.Ex)

map_n("<C-A-s>", ":wall<CR>")
map_v("J", ":m '>+1<CR>gv=gv")
map_v("K", ":m '>-2<CR>gv=gv")

map_n("J", "mzJ`z")
map_n("<C-d>", "<C-d>zz")
map_n("<C-u>", "<C-u>zz")
map_n("n", "nzzzv")
map_n("N", "Nzzzv")

map_x("<leader>P", '"_dP')

-- map_n('<leader>p', function()
--   vim.fn.setreg('+', vim.fn.system('wl-paste -n'), 'c')
--   vim.cmd('normal! "+p')
-- end)
--
-- map_v('<leader>y', function()
--   local selected_text = vim.fn.getreg('"')
--   vim.fn.system('wl-copy', selected_text)
-- end)
--
-- map_n('<leader>yy', function()
--   local current_line = vim.fn.getline('.')
--   vim.fn.system('wl-copy', current_line)
--   -- vim.fn.system('echo ' .. vim.fn.shellescape(current_line) .. ' | wl-copy')
-- end)
--

map_n("<leader>d", '"_d')
map_v("<leader>d", '"_d')

map_n("Q", "<nop>")

-- Codeium
-- vim.g.codeium_disable_bindings = 1
map_i("<A-y>", function()
	return vim.fn["codeium#Accept"]()
end)

map_i("<A-n>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end)

map_i("<A-p>", function()
	return vim.fn["codeium#CycleCompletions"](-2)
end)

map_i("<A-Space>", function()
	return vim.fn["codeium#Complete"]()
end)

map_n("<C-Tab>", ":bnext<CR>")
map_n("<C-S-Tab>", ":bprevious<CR>")

map_n("<C-h>", "<C-w><C-h>", "Move focus to the left window")
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
