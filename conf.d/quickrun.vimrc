NeoBundle 'thinca/vim-quickrun'
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle 'tyru/open-browser.vim'
let g:quickrun_config = {}
let g:quickrun_config._ = {
	 \'runner' : 'vimproc',
	 \'runner/vimproc/updatetime' : 10,
	 \'outputter/buffer/split': ':botright'
	 \}
