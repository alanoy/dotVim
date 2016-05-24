colorscheme hybrid_material

" be 'modern'
set nocompatible
syntax on
filetype plugin indent on

" 中文帮助
set helplang=cn

" prevent vim from adding that stupid empty line at the end of every file
set noeol
set binary

" utf-8/unicode support
" requires Vim to be compiled with Multibyte support, you can check that by
" running `vim --version` and checking for +multi_byte.
if has('multi_byte')
  scriptencoding utf-8
  set encoding=utf-8

  set fencs=utf-8,gbk,chinese,latin1
  set formatoptions+=mM
  set nobomb
end

" presentation settings
set number              " precede each line with its line number
set numberwidth=3       " number of culumns for line numbers
set textwidth=0         " Do not wrap words (insert)
set nowrap              " Do not wrap words (view)
set showcmd             " Show (partial) command in status line.
" set showmatch           " Show matching brackets.
set ruler               " line and column number of the cursor position
set rulerformat=%15(%c%V\ %p%%%)
set wildmenu            " enhanced command completion
set visualbell          " use visual bell instead of beeping
set laststatus=2        " always show the status line
set cmdheight=2         " 设置命令行的高度
" set listchars=tab:\|\ ,nbsp:%,trail:-
" set list

" highlight spell errors
hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set shell=/bin/bash     " use bash for shell commands
set autowriteall        " Automatically save before commands like :next and :make
set hidden              " enable multiple modified buffers
set history=1000
set autoread            " automatically read file that has been changed on disk and doesn't have changes in vim
set backspace=indent,eol,start
set guioptions-=T       " disable toolbar"
set completeopt=menuone,preview
let bash_is_sh=1        " syntax shell files as bash scripts
set cinoptions=:0,(s,u0,U1,g0,t0 " some indentation options ':h cinoptions' for details
set modelines=5         " number of lines to check for vim: directives at the start/end of file
"set fixdel              " fix terminal code for delete (if delete is broken but backspace works)
set autoindent          " automatically indent new line

set ts=2                " number of spaces in a tab
set sw=2                " number of spaces for indent
set softtabstop=2
set smarttab
set et                  " expand tabs into spaces
set linespace=4

set linebreak " 英文单词在换行时不被截断"
set wrap

set showcmd
set noshowmode

" highlight current
" set cursorline
" set cursorcolumn

set ttimeoutlen=50      " fast Esc to normal mode"

if !has('gui_running')
  set t_Co=256
endif

" mouse settings
if has("mouse")
  set mouse=a
endif
set mousehide                           " Hide mouse pointer on insert mode."

set confirm
set shortmess=atl " 启动不显示捐赠提示"
set viminfo='20,\"50
set formatoptions=mtcql
set autochdir

" search settings
set incsearch           " Incremental search
set hlsearch            " Highlight search match
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 设定行首tab为灰色
highlight LeaderTab guifg=#888888

"cliboard seting
set clipboard=unnamed " set clipboard

"去除当前所编辑文件的路径信息，只保留文件名
"set guitablabel=%{ShortTabLabel()}

" 匹配行首tab
match LeaderTab /\t/

set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]

"光标可以定位在没有实际字符的地方
set ve=block

" omni completion settings
" set ofu=syntaxcomplete#Complete
" let g:rubycomplete_buffer_loading = 0
" let g:rubycomplete_classes_in_global = 1

" autocomplete
set complete=.,w,b,k,t,i
set completeopt=longest,menu

" folding
set foldcolumn=0        " columns for folding
set foldmethod=indent
set foldlevel=9
set nofoldenable        "dont fold by default "

" extended '%' mapping for if/then/else/end etc
" runtime macros/matchit.vim

let mapleader = ","
let maplocalleader = "\\""

" =====================
" AutoCmd 自动运行
" =====================
if has("autocmd")
  augroup vimrcEx " 记住上次文件位置
    au!
    autocmd FileType text setlocal textwidth=80
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
  augroup END

  " JavaScript 语法高亮
  au FileType html,javascript let g:javascript_enable_domhtmlcss = 1
  au BufRead,BufNewFile *.js setf jquery

  " 给各语言文件添加 Dict
  au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
  au FileType css setlocal dict+=~/.vim/dict/css.dict
  au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict

  " 格式化 JavaScript 文件
  " au FileType javascript map <leader>jb :call g:Jsbeautify()<cr>
  au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

  " CSS3 语法支持
  " au BufRead,BufNewFile *.css set ft=css syntax=css3

  " 增加 Objective-C 语法支持
  au BufNewFile,BufRead,BufEnter,WinEnter,FileType *.m,*.h setf objc

  " 将指定文件的换行符转换成 UNIX 格式
  au FileType php,javascript,html,css,python,vim,vimwiki set ff=unix
endif

" 自动载入VIM配置文件
autocmd! bufwritepost vimrc source $MYVIMRC

if has("unix")
  set fileformats=unix,dos,mac
  nmap <leader>e :tabnew $HOME/.vimrc<cr>
  let $VIMFILES = $HOME."/.vim"
else
  set fileformats=dos,unix,mac
  nmap <leader>e :tabnew $VIM/_vimrc<cr>
  let $VIMFILES = $VIM."/vimfiles"
endif

" 保存时自动删除行尾空格和tab
au BufWritePre * sil %s/\s\+$//e
au BufWritePre * %s/^$\n\+\%$//ge

" 自动删除行尾空格
autocmd BufWritePre * :%s/\s\+$//e
