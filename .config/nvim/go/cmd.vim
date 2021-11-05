" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

" Run runs the current file (and their dependencies if any) and outputs it.
" This is intended to test small programs and play with them. It's not
" suitable for long running apps, because vim is blocking by default and
" calling long running apps will block the whole UI.
function! go#cmd#Run(bang, ...) abort
  if go#config#TermEnabled()
    call go#cmd#RunTerm(a:bang, '', a:000)
    return
  endif

  if go#util#has_job()
    " NOTE(arslan): 'term': 'open' case is not implement for +jobs. This means
    " executions waiting for stdin will not work. That's why we don't do
    " anything. Once this is implemented we're going to make :GoRun async
  endif

  let l:status = {
        \ 'desc': 'current status',
        \ 'type': 'run',
        \ 'state': "started",
        \ }

  call go#statusline#Update(expand('%:p:h'), l:status)

  let l:cmd = ['go', 'run']
  let l:tags = go#config#BuildTags()
  if len(l:tags) > 0
    let l:cmd = l:cmd + ['-tags', l:tags]
  endif

  if a:0 == 0
    let l:files = go#tool#Files()
  else
    let l:files = map(copy(a:000), funcref('s:expandRunArgs'))
  endif

  let l:cmd = l:cmd + l:files

  if go#util#IsWin()
    if go#util#HasDebug('shell-commands')
      call go#util#EchoInfo(printf('shell command: %s', string(l:cmd)))
    endif
    try
      let l:dir = go#util#Chdir(expand("%:p:h"))
      exec printf('!%s', go#util#Shelljoin(l:cmd, 1))
    finally
      call go#util#Chdir(l:dir)
    endtry

    let l:status.state = 'success'
    if v:shell_error
      let l:status.state = 'failed'
      if go#config#EchoCommandInfo()
        redraws!
        call go#util#EchoError('[run] FAILED')
      endif
    else
      if go#config#EchoCommandInfo()
        redraws!
        call go#util#EchoSuccess('[run] SUCCESS')
      endif
    endif

    call go#statusline#Update(expand('%:p:h'), l:status)
    return
  endif

  " :make expands '%' and '#' wildcards, so they must also be escaped
  let l:default_makeprg = &makeprg
  let &makeprg = go#util#Shelljoin(l:cmd, 1)

  let l:listtype = go#list#Type("GoRun")

  let l:status.state = 'success'

  let l:dir = go#util#Chdir(expand("%:p:h"))
  try
    " backup user's errorformat, will be restored once we are finished
    let l:old_errorformat = &errorformat
    let &errorformat = s:runerrorformat()

    if go#util#HasDebug('shell-commands')
      call go#util#EchoInfo(printf('shell command: %s', string(l:cmd)))
    endif

    if l:listtype == "locationlist"
      exe 'lmake!'
    else
      exe 'make!'
    endif
  finally
    call go#util#Chdir(l:dir)
    let &errorformat = l:old_errorformat
    let &makeprg = l:default_makeprg
  endtry

  let l:errors = go#list#Get(l:listtype)

  call go#list#Window(l:listtype, len(l:errors))
  if !empty(l:errors)
    let l:status.state = 'failed'
    if !a:bang
      call go#list#JumpToFirst(l:listtype)
    endif
  endif
  call go#statusline#Update(expand('%:p:h'), l:status)
endfunction

function! s:runerrorformat()
  let l:panicaddress = "%\\t%#%f:%l +0x%[0-9A-Fa-f]%\\+"
  let l:errorformat = '%A' . l:panicaddress . "," . &errorformat
  return l:errorformat
endfunction

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save
