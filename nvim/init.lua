vim.o.number = true
vim.o.relativenumber = false
vim.o.wrap = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"

require('smear_cursor').setup({
    stiffness = 0.6,
    trailing_stiffness = 0.4,
    damping = 0.95,
    damping_insert_mode = 0.95,
    distance_stop_animating = 0.1,
    legacy_computer_symbols_support = true,
}) 

require('mini.pairs').setup({
    modes = { insert = true, command = false, terminal = false },
    mappings = {
    ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
    ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
    ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

    [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
    [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

    ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
    ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
    ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
    },
})

local function get_wal_colors()
  local json_file = io.open(vim.fn.expand("~/.cache/wal/colors.json"), "r")
  if not json_file then return nil end
  
  local json_content = json_file:read("*all")
  json_file:close()
  
  local colors = {}
  for key, value in string.gmatch(json_content, '"(%w+)":%s*"([^"]+)"') do
    if key == "background" or key == "foreground" then
      colors[key] = value
    elseif key:match("color%d+") then
      if not colors.colors then colors.colors = {} end
      colors.colors[key] = value
    end
  end
  
  return {
    special = { background = colors.background, foreground = colors.foreground },
    colors = colors.colors
  }
end

local function load_colorscheme()
  local colors = get_wal_colors()
  vim.cmd("highlight clear")
  vim.o.background = "dark"
  vim.api.nvim_set_hl(0, "Normal", { bg = colors.special.background, fg = colors.special.foreground })
  vim.api.nvim_set_hl(0, "Comment", { fg = colors.colors.color8, italic = true })
  vim.api.nvim_set_hl(0, "String", { fg = colors.colors.color2 })
  vim.api.nvim_set_hl(0, "Function", { fg = colors.colors.color4 })
  vim.api.nvim_set_hl(0, "Keyword", { fg = colors.colors.color1 })
  vim.api.nvim_set_hl(0, "Number", { fg = colors.colors.color3 })
  vim.api.nvim_set_hl(0, "Type", { fg = colors.colors.color6 })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = colors.colors.color0, fg = colors.special.foreground })
  vim.api.nvim_set_hl(0, "LineNr", { fg = colors.colors.color8 })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.colors.color4, bold = true })
  vim.api.nvim_set_hl(0, "Visual", { bg = colors.colors.color2 })
  vim.g.colors_name = "wal"
end

load_colorscheme()

vim.api.nvim_create_user_command(
    'ReloadWal',
    load_colorscheme,
    {}
)
