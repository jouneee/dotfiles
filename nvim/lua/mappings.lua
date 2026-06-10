require "nvchad.mappings"

local function buf_dir()
    local dir = vim.fn.expand('%:p:h')
    return dir ~= '' and dir or vim.loop.cwd()
end

local function scoped(picker)
    return function() picker({ cwd = buf_dir() }) end
end

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "ne", "<ESC>")

local builtin = require('telescope.builtin')
-- telescope default
map('n', '<leader>fsf', builtin.find_files, { desc = 'Search files'})
map('n', '<leader>fsg', builtin.live_grep, {desc = 'Live grep'})
map('n', '<leader>fsh', builtin.help_tags, { desc = 'Help' })
-- telescope scoped
map('n', '<leader>ff', scoped(builtin.find_files), { desc = 'Search files in scope'})
map('n', '<leader>fg', scoped(builtin.live_grep), { desc = 'Live grep in scope'})
map('n', '<leader>fb', scoped(builtin.buffers), { desc = 'Search buffers in scope'})
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map({ "i" }, "<C-d>", "<cmd> t . <cr>")
