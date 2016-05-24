" powerline
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts = 1
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_inactive_collapse=1

" let g:airline#extensions#branch#empty_message = 'No Branch'
" let g:airline#extensions#wordcount#enabled = 1
" let g:airline#extensions#whitespace#enabled = 1

let g:Powerline_symbols="fancy"
let g:airline_symbols = {}
let g:airline_left_sep = "\u2b80"
let g:airline_left_alt_sep = "\u2b81"
let g:airline_right_sep = "\u2b82"
let g:airline_right_alt_sep = "\u2b83"
let g:airline_symbols.branch = "\u2b60"
let g:airline_symbols.readonly = "\u2b64"
let g:airline_symbols.linenr = "\u2b61"

"设置顶部tabline栏符号显示"
let g:airline#extensions#tabline#left_sep = "\u2b80"
let g:airline#extensions#tabline#left_alt_sep = "\u2b81"


" js libraries syntax
let g:used_javascript_libs = 'underscore,backbone,jquery,requirejs,angularjs'


" emmet
let g:user_emmet_install_global = 0
autocmd FileType html EmmetInstall


" js beautify
" map <leader>jb :call JsBeautify()<cr>
autocmd FileType javascript map <leader>jb :call JsBeautify()<cr>
" for html
autocmd FileType html map <Leader>jb :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css map <Leader>jb :call CSSBeautify()<cr>"


" syntastic
if &diff
else
  let g:syntastic_enable_signs=1
  let g:syntastic_auto_loc_list=2
  let g:syntastic_check_on_wq=0
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'
endif


" css3 syntax
:highlight VendorPrefix guifg=#00ffff gui=bold
:match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/


" NERD Tree
map <F6> :NERDTreeToggle<CR>
imap <F6> <ESC>:NERDTreeToggle<CR>

" NERD Comment
" 让注释与语句间保留一个空格
let NERDSpaceDelims=1
" 多行注释时样子更好看
let NERDCompactSexyComs=1

let g:SuperTabDefaultCompletionType="<c-n>"

" use neocomplcache
let g:neocomplcache_enable_at_startup=1

" disable autocomplPop
let g:acp_enableAtStartup = 0

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Use camel case completion.
" let g:neocomplcache_enable_camel_case_completion = 1

" Use underbar completion.
" let g:neocomplcache_enable_underbar_completion = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vim/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions',
  \ 'javascript' : $HOME.'/.vim/dict/javascript.dict'
  \}

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Ctrl+e close popup
" inoremap <expr><C-e> neocomplcache#cancel_popup()

" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
  " return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  " return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" endfunction

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Ctrlp
let g:ctrlp_map = '<c-p>'  " Leave this empty to disable the default mapping
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 2
" let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
" let g:ctrlp_custom_ignore = {
  " \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  " \ 'file': '\.exe$\|\.so$\|\.dll$',
  " \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  " \ }
