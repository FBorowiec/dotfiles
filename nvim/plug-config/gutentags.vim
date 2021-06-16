" gutentags
" =============================================================================
scriptencoding utf-8

let g:gutentags_add_default_project_roots = 1
let g:gutentags_project_root = ['WORKSPACE']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_cache_dir = expand('~/.cache/tags')
"command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

" ctags fields
"    a: Access (or export) of class members
"    i: Inheritance information
"    l: Language of input file containing tag
"    m: Implementation information
"    n: Line number of tag definition
"    S: Signature of routine (e.g. prototype or parameter list)

let g:gutentags_ctags_extra_args = [
			\ '--extra=+fq',
			\ '--c++-kinds=+p',
			\ '--tag-relative=yes',
			\ '--fields=+ailmnS',
			\ ]

let g:gutentags_ctags_exclude = [
			\'target',
			\'node_modules',
			\'bundle.js',
			\'bazel-*',
			\ '*.git', '*.js.map', '.svn', '.hg',
			\'*.min.*', '*.swp', '*.bak', '*.tar.*',
			\'*.tex', '*.css', '*.json', '*.js',
			\'*.html', '*.svg', '*.m', '*.proto',
			\'*.xml', '*.inl', '*.ini', '*.txt',
			\]

if !get(g:, 'loaded_gutentags', 0)
  finish
endif

function! airline#extensions#gutentags#status()
  let msg = gutentags#statusline()
  return empty(msg) ? '' :  'Gen. ' . msg
endfunction

function! airline#extensions#gutentags#init(ext)
  call airline#parts#define_function('gutentags', 'airline#extensions#gutentags#status')
endfunction
