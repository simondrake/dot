" Current values are: ["snakecase", camelcase", "lispcase", "pascalcase", "keep"].
let g:go_addtags_transform = 'camelcase'
let g:go_addtags_skip_unexported = 1

" -- tags
command! -nargs=* -range GoAddTags call go#tags#Add(<line1>, <line2>, <count>, <f-args>)
command! -nargs=* -range GoRemoveTags call go#tags#Remove(<line1>, <line2>, <count>, <f-args>)

" -- fillstruct
command! -nargs=0 GoFillStruct call go#fillstruct#FillStruct()

" -- GoRun
command! -nargs=* -bang -complete=file GoRun call go#cmd#Run(<bang>0,<f-args>)

" -- GoBuildTags
command! -nargs=? -bang GoBuildTags call go#cmd#BuildTags(<bang>0, <f-args>)
