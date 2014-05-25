"===============================================================================
" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Keithbsmiley/rspec.vim'

augroup RUBY
	autocmd!
	autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete tabstop=2 shiftwidth=2
	autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

let g:quickrun_config.ruby = {
      \ 'cmdopt'    : '--test',
      \ }
let g:quickrun_config['ruby.rspec'] = {
	 \ 'command': 'rspec',
	 \ 'cmdopt': '-fs --color -I.',
	 \ 'outputter/buffer/filetype': 'rspec-result'
	 \}

"===============================================================================
" Rails 
NeoBundle 'tpope/vim-rails'
" CoffeeScript's syntax + autocompile
NeoBundle 'kchmck/vim-coffee-script'
" JavaScript test
NeoBundle 'claco/jasmine.vim'
NeoBundle 'noahlh/html5.vim'
NeoBundle 'groenewege/vim-less'


"===============================================================================
" CoffeeScript
augroup CoffeeScript
	autocmd!
	autocmd FileType coffee setlocal ts=2 sw=2
augroup END

