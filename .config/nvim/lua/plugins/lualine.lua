local gps = require("nvim-gps")

require('lualine').setup{
  options = {
    icons_enabled = true,
    theme = 'papercolor_light',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {
      'mode'
    },
    lualine_b = {
      'branch',
      'diff'
    },
    lualine_c = {
      {
        'filename',
        file_status = false, -- displays file status (readonly status, modified status)
        path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
      'lsp_progress',
      {
        gps.get_location,
        cond = gps.is_available
      },
    },
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },

  extensions = { 'fzf' },
}
