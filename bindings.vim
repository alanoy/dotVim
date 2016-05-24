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

" json pretty
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" Use spacebar toggle fold
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

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


if &diff
  nmap <leader>pd [c
  nmap <leader>nd ]c
endif
