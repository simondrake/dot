" Enable the default set of mappings
let g:vimspector_enable_mappings = 'HUMAN'

nmap <leader>vl :call vimspector#Launch()<CR>
nmap <leader>vr :VimspectorReset<CR>
nmap <leader>ve :VimspectorEval
nmap <leader>vw :VimspectorWatch
nmap <leader>vo :VimspectorShowOutput


nmap <leader>vi <Plug>VimspectorBalloonEval
xmap <leader>vi <Plug>VimspectorBalloonEval

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" Run :VimspectorInstall to install adapters
let g:vimspector_install_gadgets = [ 'vscode-go' ]

let g:vimspector_base_dir=expand('$HOME/.vim/vimspector-config')

" Run test under cursor
nnoremap <leader>ct :call vimspector#LaunchWithSettings( {'configuration': 'test-current-test', 'lineNumber': line('.')} )<cr>

"===========================================
"=> Human Mode Defaults
"===========================================

" Key	            Function	                                                    API
" F5	            When debugging, continue. Otherwise start debugging.	        vimspector#Continue()
" F3	            Stop debugging.	                                                vimspector#Stop()
" F4	            Restart debugging with the same configuration.	                vimspector#Restart()
" F6	            Pause debugger.	                                                vimspector#Pause()
" F9	            Toggle line breakpoint on the current line.	                    vimspector#ToggleBreakpoint()
" <leader>F9	    Toggle conditional line breakpoint on the current line.	        vimspector#ToggleBreakpoint( { trigger expr, hit count expr } )
" F8	            Add a function breakpoint for the expression under cursor	    vimspector#AddFunctionBreakpoint( '<cexpr>' )
" <leader>F8	    Run to Cursor	                                                vimspector#RunToCursor()
" F10	            Step Over	                                                    vimspector#StepOver()
" F11	            Step Into	                                                    vimspector#StepInto()
" F12	            Step out of current function scope	                            vimspector#StepOut()
