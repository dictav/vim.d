NeoBundle 'rcmdnk/vim-markdown'
let g:vim_markdown_folding_disabled=1
let g:quickrun_config.markdown = {
      \ 'outputter' : 'browser',
      \ 'cmd'       : 'kramdown',
      \ 'exec'      : '%c %s'
      \ }

