" Look key-mappings.vimrc
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'sgur/ctrlp-extensions.vim'
NeoBundle 'kaneshin/ctrlp-sonictemplate'
let g:ctrlp_map = '<Nop>'
let g:ctrlp_use_migemo = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard | grep -v www']
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['menu', 'funky',  'tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
