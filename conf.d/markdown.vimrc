NeoBundle 'godlygeek/tabular'
NeoBundle 'joker1007/vim-markdown-quote-syntax'
NeoBundle 'rcmdnk/vim-markdown'

let g:markdown_quote_syntax_codeblocks = [["^\\s*\\~\\{3,}\.*\\.\\?", ".*$","^\\s*\\~\\{3,}\\ze\\s*$"]]

let g:vim_markdown_liquid=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
let g:vim_markdown_folding_disabled=1
au BufRead,BufNewFile *.{txt,text} set filetype=markdown

let g:quickrun_config.markdown = {
      \ 'outputter' : 'browser',
      \ 'cmd'       : 'kramdown',
      \ 'exec'      : '%c %s'
      \ }

let g:quickrun_config["markdown/watchdogs_checker"] = {
      \ "type" : "markdown",
      \}
