NeoBundle 'Shougo/neocomplete'
let g:neocomplete#enable_at_startup = 1
" Define keyword.
let g:neocomplete#keyword_patterns = {}
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#omni_patterns = {}

"" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType perl setlocal omnifunc=perlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType vim setlocal omnifunc=complete#CompleteCSS

let g:neocomplete#dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'coffee' : $HOME.'/.vim/dict/javascript.dict'
    \ }
