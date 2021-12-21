" Google-codefmt
if isdirectory(expand("~/.config/nvim/plugged/vim-codefmt/"))
    augroup autoformat_settings
      autocmd FileType bzl AutoFormatBuffer buildifier
      autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
      autocmd FileType dart AutoFormatBuffer dartfmt
      autocmd FileType go AutoFormatBuffer gofmt
      autocmd FileType gn AutoFormatBuffer gn
      " autocmd FileType html,css,json AutoFormatBuffer js-beautify
      autocmd FileType java AutoFormatBuffer google-java-format
      autocmd FileType lua AutoFormatBuffer lua-fmt
      autocmd FileType python AutoFormatBuffer black
    augroup END
endif

" Google-Glaive
if isdirectory(expand("~/.config/nvim/plugged/vim-glaive/"))
    call glaive#Install()
    Glaive codefmt plugin[mappings]
endif
