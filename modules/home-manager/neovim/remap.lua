vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map_n = function(keys, func, desc)
	vim.keymap.set("n", keys, func, desc)
end

local map_v = function(keys, func, desc)
	vim.keymap.set("v", keys, func, desc)
end

local map_x = function(keys, func, desc)
	vim.keymap.set("x", keys, func, desc)
end

local map_i = function(keys, func, desc)
	vim.keymap.set("i", keys, func, desc)
end

map_v("J", ":m '>+1<CR>gv=gv", "Move text up")
map_n("J", "mzJ`z", "Join lines without moving cursor")
map_v("K", ":m '>-2<CR>gv=gv", "Move text down")
map_n("N", "Nzzzv", "Repeat last search then center")
map_n("n", "nzzzv", "Repeat last search,in opposite direction then center")
map_n("Q", "<nop>", "Disable Q")

map_n("<leader>pv", vim.cmd.Ex, "Open file explorer")
map_x("<leader>P", '"_dP', "Put without yank")
map_n("<leader>d", '"_d', "Delete without yank")
map_v("<leader>d", '"_d', "Delete without yank")
map_v("<leader>/", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", "Search selection")
map_n("<leader>u", vim.cmd.UndotreeToggle)
map_n("<leader>gs", vim.cmd.Git)

local telescope_builtin = require("telescope.builtin")
local harpoon = require("harpoon")

map_n("<leader>sh", telescope_builtin.help_tags, "[S]earch [H]elp")
map_n("<leader>sk", telescope_builtin.keymaps, "[S]earch [K]eymaps")
map_n("<leader>sf", telescope_builtin.find_files, "[S]earch [F]iles")
map_n("<leader>ss", telescope_builtin.builtin, "[S]earch [S]elect Telescope")
map_n("<leader>sw", telescope_builtin.grep_string, "[S]earch current [W]ord")
map_n("<leader>sg", telescope_builtin.live_grep, "[S]earch by [G]rep")
map_n("<leader>sd", telescope_builtin.diagnostics, "[S]earch [D]iagnostics")
map_n("<leader>sr", telescope_builtin.resume, "[S]earch [R]esume")
map_n("<leader>s.", telescope_builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')
map_n("<leader><leader>", telescope_builtin.buffers, "[ ] Find existing buffers")
map_n("<leader>A", function()
	harpoon:list():append()
end)
map_n("<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

map_n("<C-1>", function()
	harpoon:list():select(1)
end)
map_n("<C-2>", function()
	harpoon:list():select(2)
end)
map_n("<C-3>", function()
	harpoon:list():select(3)
end)
map_n("<C-4>", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
map_n("<C-S-P>", function()
	harpoon:list():prev()
end)
map_n("<C-S-N>", function()
	harpoon:list():next()
end)

map_n("<C-Tab>", ":bnext<CR>", "Next buffer")
map_n("<C-d>", "<C-d>zz", "Scroll half page down then center")
map_n("<C-u>", "<C-u>zz", "Scroll half page up then center")
map_n("<C-h>", "<C-w>h", "Move focus to the left window")
map_n("<C-l>", "<C-w>l", "Move focus to the right window")
map_n("<C-j>", "<C-w>j", "Move focus to the lower window")
map_n("<C-k>", "<C-w>k", "Move focus to the upper window")
map_n("<C->>", "5<C-w>>", "Increase window width by 5")
map_n("<C-<>", "5<C-w><", "Decrease window width by 5")
map_n("<C-W>+", "5<C-w>+", "Increase window height by 5")
map_n("<C-W>-", "5<C-w>-", "Decrease window height by 5")

-- Codeium
-- vim.g.codeium_disable_bindings = 1
map_i("<A-y>", function()
	return vim.fn["codeium#Accept"]()
end, "Accept codeium suggestion")

map_i("<A-n>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, "Cycle codeium suggestions")

map_i("<A-p>", function()
	return vim.fn["codeium#CycleCompletions"](-2)
end, "Cycle codeium suggestions")

map_i("<A-Space>", function()
	return vim.fn["codeium#Complete"]()
end, "Complete codeium suggestion")

map_n("<C-S-Tab>", ":bprevious<CR>", "Previous buffer")
map_n("<C-S-n>", ":Neotree toggle<CR>", "Toggle neotree")

map_n("<C-A-s>", ":wall<CR>", "Save all files")

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
