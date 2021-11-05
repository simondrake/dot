" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

function! go#tool#Files(...) abort
  if len(a:000) > 0
    let source_files = a:000
  else
    let source_files = ['GoFiles']
  endif

  let combined = ''
  for sf in source_files
    " Strip dot in case people used ":GoFiles .GoFiles".
    let sf = substitute(sf, '^\.', '', '')

    " Make sure the passed options are valid.
    if index(go#tool#ValidFiles(), sf) == -1
      echoerr "unknown source file variable: " . sf
    endif

    if go#util#IsWin()
      let combined .= '{{range $f := .' . sf . '}}{{$.Dir}}\{{$f}}{{printf \"\n\"}}{{end}}{{range $f := .CgoFiles}}{{$.Dir}}\{{$f}}{{printf \"\n\"}}{{end}}'
    else
      let combined .= "{{range $f := ." . sf . "}}{{$.Dir}}/{{$f}}{{printf \"\\n\"}}{{end}}{{range $f := .CgoFiles}}{{$.Dir}}/{{$f}}{{printf \"\\n\"}}{{end}}"
    endif
  endfor

  let [l:out, l:err] = go#util#ExecInDir(['go', 'list', '-tags', go#config#BuildTags(), '-f', l:combined])
  return split(l:out, '\n')
endfunction

" From "go list -h".
function! go#tool#ValidFiles(...)
  let l:list = ["GoFiles", "CgoFiles", "IgnoredGoFiles", "CFiles", "CXXFiles",
    \ "MFiles", "HFiles", "FFiles", "SFiles", "SwigFiles", "SwigCXXFiles",
    \ "SysoFiles", "TestGoFiles", "XTestGoFiles"]

  " Used as completion
  if len(a:000) > 0
    let l:list = filter(l:list, 'strpart(v:val, 0, len(a:1)) == a:1')
  endif

  return l:list
endfunction

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save
