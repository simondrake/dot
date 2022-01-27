local telescope = require('telescope')

telescope.setup{
  defaults = {
    prompt_prefix = "🔍",
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
}

telescope.load_extension('neoclip')
