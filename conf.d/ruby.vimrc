"===============================================================================
" Ruby
NeoBundle 'vim-ruby/vim-ruby'

"===============================================================================
" RSpec
NeoBundle 'Keithbsmiley/rspec.vim'

augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

let g:quickrun_config['ruby.rspec'] = {
	 \ 'command': 'rspec',
	 \ 'cmdopt': '-fs --color -I.',
	 \ 'outputter/buffer/filetype': 'rspec-result'
	 \}

"===============================================================================
" Rails 
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

