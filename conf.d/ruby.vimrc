"===============================================================================
" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'tpope/vim-rails'
setlocal omnifunc=rubycomplete#Complete tabstop=2 shiftwidth=2
augroup RUBY
    autocmd!
    autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

let g:quickrun_config["ruby/watchdogs_checker" ] = {
            \ "type" : "watchdogs_checker/rubocop"
            \}

