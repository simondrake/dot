-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/simondrake/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/simondrake/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/simondrake/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/simondrake/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/simondrake/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ack.vim"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/ack.vim"
  },
  ["current-func-info.vim"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/current-func-info.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/fzf-lua"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/nvim-fzf"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["pear-tree"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/pear-tree"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  tComment = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/tComment"
  },
  tabular = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/tokyodark.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/vim-sensible"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-trailing-whitespace"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/vim-trailing-whitespace"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/simondrake/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/simondrake/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /Users/simondrake/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /Users/simondrake/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
