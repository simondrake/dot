local vi_mode_utils = require('feline.providers.vi_mode')
local lsp = require('feline.providers.lsp')
local gps = require("nvim-gps")

local components = {
  active = {},
  inactive = {},
}

-- Left
components.active[1] = {
  -- Block start
  {
    provider = '▊ ',
    hl = {
        fg = 'skyblue',
    },
  },
  -- Vi mode
  {
    provider = function()
      return vi_mode_utils.get_vim_mode()
    end,
    hl = function()
      local val = {}
      val.fg = vi_mode_utils.get_mode_color()
      val.bg = 'bg'
      val.style = 'bold'
      return val
    end,
    right_sep = ' '
  },
  -- Git Branch
  {
    provider = 'git_branch',
    hl = {
      fg = 'white',
      bg = 'magenta',
      style = 'bold',
    },
    left_sep = {
      'slant_left_2',
      { str = ' ', hl = { bg = 'magenta', fg = 'NONE' } },
    },
    right_sep = {
       { str = ' ', hl = { bg = 'magenta', fg = 'NONE' } },
       'slant_right_2',
       ' ',
    },
  },
  -- Current context
  {
    provider = function() return gps.get_location() end,
    enabled = function() return gps.is_available() end,
    hl = {
      fg = 'white',
      bg = 'bg',
      style = 'bold'
    }
  },
  {
    provider = 'lsp_progress'
  }

}

-- Middle
components.active[2] = {
  -- LSP Diagnostics
  {
    provider = 'diagnostic_errors',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
    hl = {
      fg = 'red',
      style = 'bold'
    }
  },
  {
    provider = 'diagnostic_warnings',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
    hl = {
      fg = 'yellow',
      style = 'bold'
    }
  },
}

-- Right
components.active[3] = {
  -- File Info
  {
    provider = {name = 'file_info', opts = { type = 'relative' }},
    hl = {
      fg = 'white',
      bg = 'oceanblue',
      style = 'bold',
    },
    left_sep = {
      'slant_left_2',
      { str = ' ', hl = { bg = 'oceanblue', fg = 'NONE' } },
    },
    right_sep = {
      { str = ' ', hl = { bg = 'oceanblue', fg = 'NONE' } },
      'slant_right_2',
      ' ',
    },
    opts = {
      type = 'short-path'
    },
  },

}

require('feline').setup({
  components = components,
})
