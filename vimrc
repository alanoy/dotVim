" bundle
" runtime bundle/vim-pathogen/autoload/pathogen.vim
" execute pathogen#infect()

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'lilydjwg/colorizer'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'othree/html5.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'marijnh/tern_for_vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
Bundle 'vim-scripts/matchit.zip'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/PinyinSearch'
Bundle 'scrooloose/syntastic'
" vim theme
Bundle 'jonathanfilip/vim-lucius'


" =====================
" 主题配色
" =====================

if !has('gui_running')
  set t_Co=256
endif

set clipboard=unnamed

" powerline
set guifont=Monaco\ for\ Powerline
let g:Powerline_symbols = 'fancy'

syntax enable
set background=dark
colorscheme solarized
" colorscheme Tomorrow-Night-Eighties
let g:solarized_termcolors=16
let g:solarized_termtrans=1
" let g:solarized_italic=1
" let g:solarized_bold=1

"Highlight current
" if has("gui_running")
    set cursorline
    set cursorcolumn
    " hi cursorline guibg=#0D142C
    " hi cursorline guibg=#FCF5C9
    " hi CursorColumn guibg=#FCF5C9
    " hi CursorColumn guibg=#FCF5C9
" endif


" 获取当前目录
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

" 返回当前时期
func! GetDateStamp()
    return strftime('%Y-%m-%d')
endfunction

" =====================
" 环境配置
" =====================
syntax on
filetype off
filetype plugin indent on " 打开文件类型检测

" 中文帮助
set helplang=cn

" 保留历史记录
set history=500

" 行控制
set linebreak " 英文单词在换行时不被截断
set nocompatible " 关闭vi兼容模式
set wrap " 设置自动折行

" 标签页
set tabpagemax=15 " 最多15个标签
" set showtabline=2 " 总是显示标签栏

" 关闭遇到错误时的声音提示
set noerrorbells
set novisualbell
set t_vb= " close visual bell

" 行号和标尺
set ruler " 显示标尺
set number " 行号
set rulerformat=%15(%c%V\ %p%%%)

" 命令行于状态行
set cmdheight=2 " 设置命令行的高度
set laststatus=2 " 始终显示状态行
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P] "设置状态栏的信息

" 搜索
set hlsearch  " 高亮显示搜索的内容
" set noincsearch " 关闭显示查找匹配过程
set incsearch
" set nohlsearch " 不高亮
set ignorecase " 搜索时无视大小写
set magic     " Set magic on, for regular expressions
"set showmatch " Show matching bracets when text indicator is over them
"set mat=2     " How many tenths of a second to blink

noremap <CR> :nohlsearch<CR>

" 制表符(设置所有的tab和缩进为2个空格)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " 使用空格来替换tab
set smarttab
" 自动删除行尾空格
autocmd BufWritePre * :%s/\s\+$//e

" 状态栏显示目前所执行的指令
set showcmd

" 缩进
set autoindent " 设置自动缩进
set smartindent " 设置智能缩进

" 自动重新读入
set autoread " 当文件在外部被修改，自动更新该文件

" 设定在任何模式下鼠标都可用
set mouse=a

" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start

" 备份和缓存
set nobackup
set nowb
"set noswapfile

" 自动完成
set complete=.,w,b,k,t,i
set completeopt=longest,menu " 只在下拉菜单中显示匹配项目，并且会自动插入所有匹配项目的相同文本

" 代码折叠
set foldenable
" set foldmethod=indent
set foldcolumn=0
setlocal foldlevel=1

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 显示tab和空格
" set list
" 设置tab和空格样式
" set listchars=tab:\|\ ,nbsp:%,trail:-

" 设定行首tab为灰色
highlight LeaderTab guifg=#888888

" 匹配行首tab
match LeaderTab /\t/

set wildmenu "打开 wildmenu 选项，启动具有菜单项提示的命令行自动完成。
set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]

"光标可以定位在没有实际字符的地方
set ve=block

" 启动后自动全屏
"set fullscreen

set modelines=0 " linux 系统中的行模式重置
set confirm
set shortmess=atl " 启动不显示捐赠提示
" set lines=32 columns=80

" 读写 .viminfo 文件，但不存储太多行
set viminfo='20,\"50
set formatoptions=mtcql
set autochdir

if has("gui_running")
    " Turn undofile on
    set undofile
    " Set undofile path
    set undodir=~/tmp/vim/undofile/
endif

" Set hidden to undo buffer
" set hidden

"cliboard seting
set clipboard=unnamed " set clipboard

" =====================
"    默认为 UTF-8 编码
" =====================
if has("multi_byte")
    set encoding=utf-8
    " English messages only
    " language messages zh_CN.utf-8

    if has('win32')
        language english
        let &termencoding=&encoding " 处理consle输出乱码
    endif

    set fencs=utf-8,gbk,chinese,latin1
    set formatoptions+=mM
    set nobomb " 不使用 Unicode 签名

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif


if has("unix")
    set fileformats=unix,dos,mac
    nmap <leader>e :tabnew $HOME/.vimrc<cr>
    let $VIMFILES = $HOME."/.vim"
else
    set fileformats=dos,unix,mac
    nmap <leader>e :tabnew $VIM/_vimrc<cr>
    let $VIMFILES = $VIM."/vimfiles"
endif



" =====================
" 图形界面
" =====================
if has('gui_running')
    "set guioptions=mcr " 只显示菜单
    set guioptions=   " 隐藏全部的gui选项
    "set guioptions+=r " 显示gui右边滚动条
    "Toggle Menu and Toolbar 使用F2隐藏/显示菜单
    set guioptions-=m
    set guioptions-=T
    map <silent> <F3> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <bar>
        \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
        \endif<CR>

    if has('gui_macvim')
        set guioptions+=e
    endif

    if has("win32")
        " Windows 兼容配置
        source $VIMRUNTIME/mswin.vim

        " F11 最大化
        map <f11> :call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)<cr>

        " 字体配置
        "exec 'set guifont='.iconv('Courier_New', &enc, 'gbk').':h10:cANSI'
        "exec 'set guifontwide='.iconv('微软雅黑', &enc, 'gbk').':h10'
        set guifont=YaHei_Consolas_Hybrid:h11:cANSI
        set guifontwide=YaHei_Consolas_Hybrid:h12
    endif

    if has("unix") && !has('gui_macvim')
        set guifont=PT_Mono:h13
    endif

    if has("mac") || has("gui_macvim")
        if has("gui_macvim")
            " 开启抗锯齿渲染
            set anti
            " MacVim 下的字体配置
            set guifont=PT_Mono:h13
            set guifontwide=PT_Mono:h13

            "set transparency=8
            set lines=222 columns=222

            " 使用 MacVim 原生的全屏幕功能
            let s:lines=&lines
            let s:columns=&columns
            func! FullScreenEnter()
                set lines=999 columns=999
                set fu
            endf

            func! FullScreenLeave()
                let &lines=s:lines
                let &columns=s:columns
                set nofu
            endf

            func! FullScreenToggle()
                if &fullscreen
                    call FullScreenLeave()
                else
                    call FullScreenEnter()
                endif
            endf
        endif
    endif
endif


"去除当前所编辑文件的路径信息，只保留文件名
" function ShortTabLabel()
    " let bufnrlist = tabpagebuflist(v:lnum)
    " let label = bufname(bufnrlist[tabpagewinnr(v:lnum) -1])
    " let filename = fnamemodify(label, ':t')
    " return filename
" endfunction
set guitablabel=%{ShortTabLabel()}

" =====================
" AutoCmd 自动运行
" =====================
if has("autocmd")
    "根据当前buffer切换到该文件所在工作目录
    "autocmd BufRead * :lcd! %:p:h

    augroup vimrcEx " 记住上次文件位置
        au!
        autocmd FileType text setlocal textwidth=80
        autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal g`\"" |
			\ endif
    augroup END

    " Auto Check Syntax (plugin)
    " au BufWritePost,FileWritePost *.js,*.php call CheckSyntax(1)

    " JavaScript 语法高亮
    au FileType html,javascript let g:javascript_enable_domhtmlcss = 1
    au BufRead,BufNewFile *.js setf jquery

    " 给各语言文件添加 Dict
    if has('win32')
        au FileType php setlocal dict+=$VIM/vimfiles/dict/php_funclist.dict
        au FileType css setlocal dict+=$VIM/vimfiles/dict/css.dict
        au FileType javascript setlocal dict+=$VIM/vimfiles/dict/javascript.dict
    else
        au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
        au FileType css setlocal dict+=~/.vim/dict/css.dict
        au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
    endif

    " 格式化 JavaScript 文件
    " au FileType javascript map <leader>jb :call g:Jsbeautify()<cr>
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

    " 增加 ActionScript 语法支持
    au BufNewFile,BufRead,BufEnter,WinEnter,FileType *.as setf actionscript

    " CSS3 语法支持
    " au BufRead,BufNewFile *.css set ft=css syntax=css3

    " 增加 Objective-C 语法支持
    au BufNewFile,BufRead,BufEnter,WinEnter,FileType *.m,*.h setf objc

    " 将指定文件的换行符转换成 UNIX 格式
    au FileType php,javascript,html,css,python,vim,vimwiki set ff=unix
endif

" 自动载入VIM配置文件
autocmd! bufwritepost vimrc source $MYVIMRC

" =====================
" 快捷键
" =====================
"设置','为leader快捷键
let mapleader = ","
let g:mapleader = ","

"设置快速保存和退出
"快速保存为,s
"快速退出（保存）为,w
"快速退出（不保存）为,q
nmap <leader>s :w!<cr>
nmap <leader>w :wq!<cr>
nmap <leader>q :q!<cr>

" 用c-j,k切换tab
nmap <C-t> :tabnew<cr>
nn <C-J> :tabn<cr>
nn <C-K> :tabp<cr>

"切换buffer
nmap bn :bn<cr>
nmap bp :bp<cr>

" 插入模式下上下左右移动光标
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <c-o>gj
inoremap <c-k> <c-o>gk

" 快速左右移动光标
map <C-l> <ESC>10l
map <C-h> <ESC>10h

" 使用 Ctrl+C 或 Y 复制到系统剪贴板
vnoremap <C-C> "+y
vnoremap Y "+y

" 保存时自动删除行尾空格和tab
au BufWritePre * sil %s/\s\+$//e
au BufWritePre * %s/^$\n\+\%$//ge

" 快捷打开编辑vimrc文件的键盘绑定
if has("win32")
    map <silent> <leader>ev :e $VIM/vimfiles/vimrc<cr>
    map <silent> <leader>lv :source $VIM/vimfiles/vimrc<cr> " 快速载入 vimrc 文件
else
    map <silent> <leader>ev :e ~/.vim/vimrc<cr>
    map <silent> <leader>lv :source ~/.vim/vimrc<cr> " 快速载入 vimrc 文件
endif

" 普通模式，可视模式和选择模式下使用 <Tab> 和 <Shift-Tab> 键来缩进文本
nmap <tab> v>
nmap <s-tab> v<

" map <silent> <leader>ev :e ~/.vimrc<cr>
" autocmd! bufwritepost *.vimrc source ~/.vimrc

" 选中一段文字并全文搜索这段文字
vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" Use spacebar toggle fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 插入模式按 F4 插入当前时间
imap <f4> <C-r>=GetDateStamp()<cr>

" 直接查看第一行生效的代码
nmap <C-g><C-f> :call GotoFirstEffectiveLine()<cr>

" 基本完美解决buffer切换，用buffer号加B 键
function! BufPos_ActivateBuffer(num)
    if a:num == 0
        echo "No buffer " . a:num "!"
        return
    endif
    if a:num > bufnr("$")
        echo "No buffer " . a:num "!"
    else
        if buflisted(a:num) && getbufvar(a:num, "&modifiable")
            exe "buffer " . a:num
        endif
    endif
endfunction
nmap b :<C-U>call BufPos_ActivateBuffer(v:count)<CR>

" =====================
"  插件配置
" =====================
" js libraries syntax
let g:used_javascript_libs = 'underscore,backbone,jquery,requirejs,angularjs'

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html EmmetInstall

" js beautify
map <leader>jb :call JsBeautify()<cr>

" syntastic
if &diff
else
    let g:syntastic_check_on_open = 0
    let g:syntastic_echo_current_error = 1
    let g:syntastic_enable_signs = 1
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'
    " let g:syntastic_enable_balloons = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_loc_list_height = 3
    " only display error
    let g:syntastic_quiet_warnings = 1

    highlight SyntasticErrorSign guifg=white guibg=red

    let g:syntastic_javascript_syntax_checker='jshint'
    let g:syntastic_javascript_jshint_conf='~/jshintrc.json'
endif

" vim-javascript
" let g:html_indent_inctags = 'html,body,head,tbody'
" let g:html_indent_script1 = 'inc'
" let g:html_indent_style1 = 'inc'

" javascript syntax
" To enable code folding
" au FileType javascript call JavaScriptFold()

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

" PinyinSearch
let g:PinyinSearch_Dict = $HOME.'/.vim/bundle/PinyinSearch/PinyinSearch.dict'
nnoremap <Leader>ps :call PinyinSearch()<CR>
nnoremap <Leader>pn :call PinyinNext()<CR>



" =====================
" 其他
" =====================

" 打开javascript对dom、html和css的支持
" let javascript_enable_domhtmlcss = 1

if &diff
    nmap <leader>pd [c
    nmap <leader>nd ]c
endif
