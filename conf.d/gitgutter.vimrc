NeoBundle 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 1
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
