NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'dgryski/vim-godef'

set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
exe "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
set completeopt=menu,preview
let g:neocomplete#omni_patterns.go = '\h\w*\.\?'
auto BufWritePre *.go Fmt
