function! go#config#BuildTags() abort
  return get(g:, 'go_build_tags', '')
endfunction

function! go#config#PlayBrowserCommand() abort
    if go#util#IsWin()
        let go_play_browser_command = '!start rundll32 url.dll,FileProtocolHandler %URL%'
    elseif go#util#IsMac()
        let go_play_browser_command = 'open %URL%'
    elseif executable('xdg-open')
        let go_play_browser_command = 'xdg-open %URL%'
    elseif executable('firefox')
        let go_play_browser_command = 'firefox %URL% &'
    elseif executable('chromium')
        let go_play_browser_command = 'chromium %URL% &'
    else
        let go_play_browser_command = ''
    endif

    return get(g:, 'go_play_browser_command', go_play_browser_command)
endfunction

function! go#config#ListType() abort
  return get(g:, 'go_list_type', '')
endfunction

function! go#config#Debug() abort
  return get(g:, 'go_debug', [])
endfunction

function! go#config#AddtagsTransform() abort
  return get(g:, 'go_addtags_transform', "snakecase")
endfunction

function! go#config#AddtagsSkipUnexported() abort
  return get(g:, 'go_addtags_skip_unexported', 0)
endfunction

function! go#config#BinPath() abort
  return get(g:, "go_bin_path", "")
endfunction

function! go#config#SearchBinPathFirst() abort
  return get(g:, 'go_search_bin_path_first', 1)
endfunction

function! go#config#FillStructMode() abort
  return get(g:, 'go_fillstruct_mode', 'fillstruct')
endfunction
