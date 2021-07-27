local g = vim.g
g.NERDTreeQuitOnOpen = 1
g.NERDTreeMinimalUI = 1
g.NERDTreeAutoDeleteBuffer = 1

local map = vim.api.nvim_set_keymap
-- map('n', '<leader>y', ':NERDTreeFind<CR>', { silent = true })
-- map('n', '<leader>k', ':NERDTreeToggle<CR>', { silent = true })
map('n', '-', ':call ToggleTree()<CR>', { silent = true })

vim.api.nvim_exec([[
  function! ToggleTree()
    if &filetype == ''
      :NERDTreeToggle
    elseif &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
      :call nerdtree#ui_glue#upDir(v:true)
    else
      :NERDTreeFind
    endif
  endfunction
]], false)
