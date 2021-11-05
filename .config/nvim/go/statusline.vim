" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

" Statusline
""""""""""""""""""""""""""""""""

" s:statuses is a global reference to all statuses. It stores the statuses per
" import paths (map[string]status), where each status is unique per its
" type. Current status dict is in form:
" {
"   'desc'        : 'Job description',
"   'state'       : 'Job state, such as success, failure, etc..',
"   'type'        : 'Job type, such as build, test, etc..'
"   'created_at'  : 'Time it was created as seconds since 1st Jan 1970'
" }
let s:statuses = {}

" timer_id for cleaner
let s:timer_id = 0

" last_status stores the last generated text per status
let s:last_status = ""

" Update updates (adds) the statusline for the given status_dir with the
" given status dict. It overrides any previously set status.
function! go#statusline#Update(status_dir, status) abort
  let a:status.created_at = reltime()
  let s:statuses[a:status_dir] = a:status

  " force to update the statusline, otherwise the user needs to move the
  " cursor
  exe 'let &ro = &ro'

  " before we stop the timer, check if we have any previous jobs to be cleaned
  " up. Otherwise every job will reset the timer when this function is called
  " and thus old jobs will never be cleaned
  call s:clear()

  " also reset the timer, so the user has time to see it in the statusline.
  " Setting the timer_id to 0 will cause a new timer to be created the next
  " time the go#statusline#Show() is called.
  call timer_stop(s:timer_id)
  let s:timer_id = 0
endfunction

function! s:clear()
  for [status_dir, status] in items(s:statuses)
    let elapsed_time = reltimestr(reltime(status.created_at))
    " strip whitespace
    let elapsed_time = substitute(elapsed_time, '^\s*\(.\{-}\)\s*$', '\1', '')

    if str2nr(elapsed_time) > 10
      call remove(s:statuses, status_dir)
    endif
  endfor

  if len(s:statuses) == 0
    let s:statuses = {}
  endif

  " force to update the statusline, otherwise the user needs to move the
  " cursor
  exe 'let &ro = &ro'
endfunction

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save
