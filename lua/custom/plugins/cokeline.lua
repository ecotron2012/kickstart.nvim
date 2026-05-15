vim.pack.add { { src = 'https://github.com/willothy/nvim-cokeline', name = 'cokeline' } }

local get_hex = require('cokeline.hlgroups').get_hl_attr

local green = vim.g.terminal_color_2
local yellow = vim.g.terminal_color_3
vim.keymap.set('n', 'gb', '<plug>(cokeline-focus-prev)', { silent = true, desc = 'go to previous buffer' })
vim.keymap.set('n', 'gb', '<plug>(cokeline-focus-next)', { silent = true, desc = 'go to next buffer' })

local map = vim.api.nvim_set_keymap
local get_visible = require('cokeline/buffers').get_visible
local is_picking_focus = require('cokeline/mappings').is_picking_focus
local is_picking_close = require('cokeline/mappings').is_picking_close

local red = vim.g.terminal_color_1
local yellow = vim.g.terminal_color_3
local oceanblue = '#0066cc'
require('cokeline').setup {
  -- only show the bufferline when there are at least this many visible buffers.
  -- default: `1`.
  show_if_buffers_are_at_least = 1,

  buffers = {
    -- filter_valid = function(buffer) return buffer.filetype ~= 'netrw' and buffer.filetype ~= 'startify' end,

    focus_on_delete = 'next',

    new_buffers_position = 'next',
  },

  mappings = {
    cycle_prev_next = true,
  },

  rendering = {
    max_buffer_width = 999,
  },

  default_hl = {
    fg = function(buffer) return buffer.is_focused and get_hex('normal', 'fg') or get_hex('comment', 'fg') end,
    bg = function(buffer) return buffer.is_focused and oceanblue or get_hex('colorcolumn', 'bg') end,
  },
  sidebar = {
    filetype = { 'nvimtree', 'neo-tree' },
    components = {
      {
        text = function(buf) return buf.filetype end,
        fg = yellow,
        bg = function() return get_hex('nvimtreenormal', 'bg') end,
        bold = true,
      },
    },
  },
  components = {
    {
      text = function(buffer) return buffer.is_focused and '' or ' ' end,
      fg = function(buffer) return buffer.is_focused and buffer.index ~= 1 and get_hex('normal', 'bg') or oceanblue end,
      bg = function(buffer) return buffer.is_focused and oceanblue or get_hex('normal', 'bg') end,
    },
    {
      text = function(buffer) return (is_picking_focus() or is_picking_close()) and buffer.pick_letter .. ' ' or
        buffer.devicon.icon end,
      fg = function(buffer) return (is_picking_focus() and red) or (is_picking_close() and yellow) or
        buffer.devicon.color end,
      style = function(_) return (is_picking_focus() or is_picking_close()) and 'italic,bold' or nil end,
    },
    {
      text = function(buffer) return buffer.index .. ' ' end,
      style = 'italic',
    },
    {
      text = function(buffer) return buffer.filename .. '  ' end,
      style = function(buffer) return buffer.is_focused and 'bold' or nil end,
    },
    {
      text = function(buffer)
        if buffer.is_focused then return '' end
        local buffers = get_visible()
        local next = buffer.index + 1
        return buffers[next] and buffers[next].is_focused and '' or ' '
      end,
      fg = function(buffer) return buffer.is_focused and oceanblue or get_hex('normal', 'fg') end,
      bg = get_hex('colorcolumn', 'bg'),
    },
  },
}
