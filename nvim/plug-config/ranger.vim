" Disable default shortcut for opening ranger
let g:ranger_map_keys = 0

" open ranger when vim open a directory
let g:ranger_replace_netrw = 0

" to show hidden files, ovveriding default ranger settings
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
