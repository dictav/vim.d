NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'dgryski/vim-godef'
"NeoBundle 'fatih/vim-go'

function! s:my_format()
	exe "undojoin |keepjump Fmt"
	"let &undolevels = &undolevels
	return "\<End>\<CR>"
endfunction

augroup MyGo
	autocmd!
	autocmd BufWritePre <buffer> exe "undojoin |keepjump  Fmt"
augroup END

inoremap <silent> <Plug>(auto_format) <C-r>=<SID>my_format()<CR>
imap <buffer> <CR> <Plug>(auto_format)
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
exe "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
set completeopt=menu,preview
let g:neocomplete#omni_patterns.go = '\h\w*\.\?'

