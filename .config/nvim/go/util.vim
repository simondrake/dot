" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

" PathListSep returns the appropriate OS specific path list separator.
function! go#util#PathListSep() abort
  if go#util#IsWin()
    return ";"
  endif
  return ":"
endfunction

" IsWin returns 1 if current OS is Windows or 0 otherwise
" Note that has('win32') is always 1 when has('win64') is 1, so has('win32') is enough.
function! go#util#IsWin() abort
  return has('win32')
endfunction

" Checks if using:
" 1) Windows system,
" 2) And has cygpath executable,
" 3) And uses *sh* as 'shell'
function! go#util#IsUsingCygwinShell()
  return go#util#IsWin() && executable('cygpath') && &shell =~ '.*sh.*'
endfunction

" Run a shell command.
"
" It will temporary set the shell to /bin/sh for Unix-like systems if possible,
" so that we always use a standard POSIX-compatible Bourne shell (and not e.g.
" csh, fish, etc.) See #988 and #1276.
function! s:system(cmd, ...) abort
  " Preserve original shell, shellredir and shellcmdflag values
  let l:shell = &shell
  let l:shellredir = &shellredir
  let l:shellcmdflag = &shellcmdflag

  if !go#util#IsWin() && executable('/bin/sh')
      set shell=/bin/sh shellredir=>%s\ 2>&1 shellcmdflag=-c
  endif

  if go#util#IsWin()
    if executable($COMSPEC)
      let &shell = $COMSPEC
      set shellcmdflag=/C
    endif
  endif

  try
    return call('system', [a:cmd] + a:000)
  finally
    " Restore original values
    let &shell = l:shell
    let &shellredir = l:shellredir
    let &shellcmdflag = l:shellcmdflag
  endtry
endfunction

" Exec runs a shell command "cmd", which must be a list, one argument per item.
" Every list entry will be automatically shell-escaped
" Every other argument is passed to stdin.
function! go#util#Exec(cmd, ...) abort
  if len(a:cmd) == 0
    call go#util#EchoError("go#util#Exec() called with empty a:cmd")
    return ['', 1]
  endif

  let l:bin = a:cmd[0]

  " Lookup the full path, respecting settings such as 'go_bin_path'. On errors,
  " CheckBinPath will show a warning for us.
  let l:bin = go#path#CheckBinPath(l:bin)
  if empty(l:bin)
    return ['', 1]
  endif

  " Finally execute the command using the full, resolved path. Do not pass the
  " unmodified command as the correct program might not exist in $PATH.
  return call('s:exec', [[l:bin] + a:cmd[1:]] + a:000)
endfunction

function! s:exec(cmd, ...) abort
  let l:bin = a:cmd[0]
  let l:cmd = go#util#Shelljoin([l:bin] + a:cmd[1:])
  if go#util#HasDebug('shell-commands')
    call go#util#EchoInfo('shell command: ' . l:cmd)
  endif

  let l:out = call('s:system', [l:cmd] + a:000)
  return [l:out, go#util#ShellError()]
endfunction
"
function! go#util#ShellError() abort
  return v:shell_error
endfunction

" Shelljoin returns a shell-safe string representation of arglist. The
" {special} argument of shellescape() may optionally be passed.
function! go#util#Shelljoin(arglist, ...) abort
  try
    let ssl_save = &shellslash
    set noshellslash
    if a:0
      return join(map(copy(a:arglist), 'shellescape(v:val, ' . a:1 . ')'), ' ')
    endif

    return join(map(copy(a:arglist), 'shellescape(v:val)'), ' ')
  finally
    let &shellslash = ssl_save
  endtry
endfunction

" Returns the byte offset for line and column
function! go#util#Offset(line, col) abort
  if &encoding != 'utf-8'
    let sep = go#util#LineEnding()
    let buf = a:line == 1 ? '' : (join(getline(1, a:line-1), sep) . sep)
    let buf .= a:col == 1 ? '' : getline('.')[:a:col-2]
    return len(iconv(buf, &encoding, 'utf-8'))
  endif
  return line2byte(a:line) + (a:col-2)
endfunction

" " Returns the byte offset for the cursor
function! go#util#OffsetCursor() abort
  return go#util#Offset(line('.'), col('.'))
endfunction

" Get all lines in the buffer as a a list.
function! go#util#GetLines()
  let buf = getline(1, '$')
  if &encoding != 'utf-8'
    let buf = map(buf, 'iconv(v:val, &encoding, "utf-8")')
  endif
  if &l:fileformat == 'dos'
    " XXX: line2byte() depend on 'fileformat' option.
    " so if fileformat is 'dos', 'buf' must include '\r'.
    let buf = map(buf, 'v:val."\r"')
  endif
  return buf
endfunction

" Convert the current buffer to the "archive" format of
" golang.org/x/tools/go/buildutil:
" https://godoc.org/golang.org/x/tools/go/buildutil#ParseOverlayArchive
"
" > The archive consists of a series of files. Each file consists of a name, a
" > decimal file size and the file contents, separated by newlinews. No newline
" > follows after the file contents.
function! go#util#archive()
    let l:buffer = join(go#util#GetLines(), "\n")
    return expand("%:p:gs!\\!/!") . "\n" . strlen(l:buffer) . "\n" . l:buffer
endfunction

" Report if the user enabled a debug flag in g:go_debug.
function! go#util#HasDebug(flag)
  return index(go#config#Debug(), a:flag) >= 0
endfunction

" Echo a message to the screen and highlight it with the group in a:hi.
"
" The message can be a list or string; every line with be :echomsg'd separately.
function! s:echo(msg, hi)
  let l:msg = []
  if type(a:msg) != type([])
    let l:msg = split(a:msg, "\n")
  else
    let l:msg = a:msg
  endif

  " Tabs display as ^I or <09>, so manually expand them.
  let l:msg = map(l:msg, 'substitute(v:val, "\t", "        ", "")')

  exe 'echohl ' . a:hi
  for line in l:msg
    echom "vim-go: " . line
  endfor
  echohl None
endfunction

function! go#util#EchoSuccess(msg)
  call s:echo(a:msg, 'Function')
endfunction
function! go#util#EchoError(msg)
  call s:echo(a:msg, 'ErrorMsg')
endfunction
function! go#util#EchoWarning(msg)
  call s:echo(a:msg, 'WarningMsg')
endfunction
function! go#util#EchoProgress(msg)
  redraw
  call s:echo(a:msg, 'Identifier')
endfunction
function! go#util#EchoInfo(msg)
  call s:echo(a:msg, 'Debug')
endfunction

" Check if Vim jobs API is supported.
"
" The (optional) first parameter can be added to indicate the 'cwd' or 'env'
" parameters will be used, which wasn't added until a later version.
function! go#util#has_job(...) abort
  return has('job') || has('nvim')
endfunction

" ExecInDir will execute cmd with the working directory set to the current
" buffer's directory.
function! go#util#ExecInDir(cmd, ...) abort
  let l:wd = expand('%:p:h')
  return call('go#util#ExecInWorkDir', [a:cmd, l:wd] + a:000)
endfunction

" ExecInWorkDir will execute cmd with the working diretory set to wd. Additional arguments will be passed
" to cmd.
function! go#util#ExecInWorkDir(cmd, wd, ...) abort
  if !isdirectory(a:wd)
    return ['', 1]
  endif

  let l:dir = go#util#Chdir(a:wd)
  try
    let [l:out, l:err] = call('go#util#Exec', [a:cmd] + a:000)
  finally
    call go#util#Chdir(l:dir)
  endtry
  return [l:out, l:err]
endfunction

function! go#util#Chdir(dir) abort
  if !exists('*chdir')
    let l:olddir = getcwd()
    let cd = exists('*haslocaldir') && haslocaldir() ? 'lcd' : 'cd'
    execute printf('%s %s', cd, fnameescape(a:dir))
    return l:olddir
  endif
  return chdir(a:dir)
endfunction

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save
