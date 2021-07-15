" Current values are: ["snakecase", camelcase", "lispcase", "pascalcase", "keep"].
let g:go_addtags_transform = 'camelcase'

command! -nargs=* -range GoAddTags call go#tags#Add(<line1>, <line2>, <count>, <f-args>)
command! -nargs=0 GoFillStruct call go#fillstruct#FillStruct()
