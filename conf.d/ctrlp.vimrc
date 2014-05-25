" Look key-mappings.vimrc
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'sgur/ctrlp-extensions.vim'
let g:ctrlp_map = '<Nop>'
let g:ctrlp_use_migemo = 1
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['menu', 'funky', 'tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
