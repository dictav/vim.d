NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'tyru/open-browser.vim'
let g:quickrun_config = {}
let g:quickrun_config = {
      \	"_" : {
      \   "outputter/buffer/split" : ":botright 8sp",
      \   "outputter" : "multi:buffer:quickfix",
      \   "outputter/buffer/running_mark" : "running...",
      \   "outputter/quickfix/open_cmd" : "",
      \   "runner" : "vimproc",
      \   "runner/vimproc/updatetime" : 500,
      \   "runner/vimproc/sleep" : 10,
      \   "hook/inu/enable" : 0,
      \   "hook/sweep/enable" : 0,
      \   "hook/clear_quickfix/enable_hook_loaded" : 1,
      \   "hook/clear_bufixlist/enable_hook_loaded" : 1,
      \   "hook/clear_location_list/enable_hook_loaded" : 1,
      \   "hook/hier_update/enable_exit" : 1,
      \   "hook/quickfix_status_enable/enable_exit" : 1,
      \   "hook/quickfix_replate_tempname_to_bufnr/enable_exit" : 1,
      \   "hook/quickfix_replate_tempname_to_bufnr/priority_exit" : -10,
      \   "hook/extend_config/enable": 1,
      \   "hook/extend_config/force": 1,
      \   "hook/echo/enable" : 1,
      \   "hook/echo/enable_output_exit" : 1,
      \   "hook/echo/priority_exit" : 10000,
      \   "hook/echo/output_success" : "😊",
      \   "hook/echo/output_failure" : "😭",
      \	},
      \}

