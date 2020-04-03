"==========================================
" ProjectLink: https://github.com/wklken/vim-for-server
" Author: JZL
" Version: 0.3
" Email: wklken@yeah.net
" BlogPost: http://www.wklken.me
" Donation: http://www.wklken.me/pages/donation.html
" ReadMe: README.md
" Last_modify: 2015-07-07
" Desc: simple vim config for server, without any plugins.
"==========================================

" define leader key
let mapleader=','
let g:mapleader = ','

" open syntax
syntax on

" how many lines of history VIM has to remember
set history=1000

" filetype
filetype on
" Enable filetype plugins
filetype plugin on
filetype indent on

" base
set nocompatible                " don't bother with vi compatibility
set autoread                    " reload files when changed on disk, i.e. via `git checkout`
set shortmess=atI               " 启动的时候不显示那个援助乌干达儿童的提示

set magic                       " For regular expressions turn magic on
set title                       " change the terminal's title
"set nobackup                    " do not keep a backup file

set novisualbell                " turn off visual bell
set noerrorbells                " don't beep
set vb t_vb=                    " turn off error beep/flash, 其实是为了兼容vi、vim、gvim, 该参数的作用与noerrorbells一样.

" show location
" set cursorcolumn
set cursorline

" movement
set scrolloff=5                 " keep 5 lines when scrolling


" show
set ruler                       " show the current row and column
"set number                     " show line numbers
"set nowrap                      " don't auto line wrap 
set showcmd                     " display incomplete commands
set showmode                    " display current modes
set showmatch                   " jump to matches when entering parentheses and display matchs
set matchtime=2                 " tenths of a second to show the matching parenthesis(unit is 0.1 second)

" search
set hlsearch                    " highlight searches
set incsearch                   " do incremental searching, search as you type
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present
" 为寻找到的字符串加背景颜色
highlight Search ctermbg=black  ctermfg=white guifg=white guibg=black
" 每次重新进入文件取消之前的高亮效果
exec "nohlsearch"

" tab
set expandtab                   " expand tabs to spaces
set smarttab                    " 智能tab, 根据文件中其他地方的缩进空格个数来确定一个 tab 是多少个空格
set shiftround                  " 缩进时取整,当你的缩进不成倍时, 开启这个选项将会让 Vim 自动帮你把周围的缩进化零为整

" indent
" 注意autoindent可以使用ai替代, smartindent可以使用si替代, shiftwidth可以使用
" sw替代
set autoindent smartindent shiftround
set tabstop=4                   " 按下Tab 键时, Vim 显示的空格数, 只是修改tab字符显示的宽度, 但是不修改tab按键的行为
set shiftwidth=4                " 在文本上按下>>即增加一级缩进, <<取消一级缩进, 或者==取消全部缩进时每一级的字符数
set softtabstop=4               " insert mode tab and backspace use 4 spaces, 影响 vim 在插入模式下按 Tab 键所实际得到的字符
set cin                         " C语言缩进
set listchars=tab:▸\ ,trail:▫   " 显示tab字符

" fold
set foldenable                  " fold switch
set foldmethod=manual           " fold mode
set foldlevel=3                 " 设定折叠深度, 即一个折叠最多存储几个子折叠
set foldcolumn=0                " 设置折叠区域的宽度
set foldclose=all               " 设置为自动关闭折叠
set foldlevelstart=99           " 打开文件是默认不折叠代码, 因为初始化级别太高
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" encoding
set encoding=utf-8
set fileencodings=utf-8,latin1
set termencoding=utf-8
set ffs=unix,dos,mac
set formatoptions+=m            " 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=B            " 合并两行中文时，不在中间加空格(当连接行时，不要在两个多字节字符之间插入空格)

" select & complete
set mouse=c                     " 鼠标模式
"set selection=inclusive        " 选择包含最后一个字符
"set selectmode=mouse,key       " 启动选择模式的方式
set completeopt=longest,menu    " 插入模式下补全功能的显示方式，分别支持弹出菜单式、插入匹配的最长文本、在预览窗口里显示
set wildmenu                    " 命令行补全增强模式,在输入命令时列出匹配项目
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc,*.class

" others
set backspace=indent,eol,start  " 设定在插入状态用退格键和Delete键可以删除回车符
set whichwrap+=<,>,h,l          " 使左右移动键在行首或行尾可以移动到前一行或下一行

" if this not work ,make sure .viminfo is writable for you 意思是权限如果不对, 可能不会生效
" 保持文件上次打开的位置
"if has("autocmd")
"   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe normal! g'\"" | endif
"endif

" ============================ theme and status line " ============================
" theme
set background=dark             " VIM背景颜色
colorscheme desert              " 配色方案
"set cursorcolumn                " 设置光标十字坐标，高亮当前列
set cursorline                  " 设置光标十字坐标，高亮当前行
" 高亮显示行的背景颜色
highlight cursorline guibg=#00ff00
" 高亮当前列的背景颜色
highlight CursorColumn guibg=#00ff00 
set cmdheight=1                 " 命令行（在状态行下）的高度，默认为1，这里是2
set lz                          " Vim 喜欢重绘屏幕, 即便是在它根本不必这样做的期间内 – 比如在宏(回放)的期间. 这告诉 Vim 不要费神地在这些场景下重绘屏幕, 以让宏更快.
set t_Co=256                    " 启用256色

" set mark column color, 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" status line
" 状态行显示的内容
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2                " Always show the status line - use 2 lines for the status bar

" ============================ specific file type ===========================
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd

autocmd BufNewFile *.py,*.cc,*.sh,*.java exec ":call SetTitle()"
func SetTitle()  
    if expand("%:e") == 'sh'  
        call setline(1, "#!/bin/bash")
        call setline(2, "##############################################################")  
        call setline(3, "# File Name: ".expand("%"))
        call setline(4, "# Version: V1.0")
        call setline(5, "# Author: JZL")
        call setline(6, "# Organization: 353553339@qq.com")
        call setline(7, "# Created Time : ".strftime("%F %T"))
        call setline(8, "# Description:")
        call setline(9, "##############################################################")
    endif  
    " python
    if expand("%:e") == 'py'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif
    normal G
    normal o
    normal o
endfunc

autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" ============================ key map ============================

" 将K与s键的作用取消
noremap K <nop>
noremap s <nop>

" 映射 键 Ctrl+j 为 Ctrl+W j 键
map <C-j> <C-W>j

nnoremap <F2> :set nu! nu?<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>

set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

au InsertLeave * set nopaste    "    离开插入模式后关闭粘贴模式
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" kj 替换 Esc
" inoremap kj <Esc>

" Quickly close the current window
nnoremap <leader>q :q<CR>
" Quickly save the current file
nnoremap <leader>w :w<CR>
" Quickly close the current file
map Q :q<CR>
" Quickly close window and save the current file
map S :wq<CR>

" select all
map <Leader>sa ggVG"

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" switch # *
" nnoremap # *
" nnoremap * #

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" remove highlight
noremap <silent><leader>/ :nohls<CR>

"Reselect visual block after indent/outdent.调整缩进后自动选中，方便再次操作
" 可以在选中一些行之后，不断地通过 < 和 > 来缩进选中的这些行
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
" y操作符命令会把文本复制到一个寄存器3中。然后可以用"p"命令把它取回。因为"y"
" 是一个操作符命令，所以你可以用"yw"来复制一个word. 同样可以使用命令记数。如下
" 例中用"y2w"命令复制两个word，"yy"命令复制一整行，"Y"也是复制整行的内容，复制
" 当前光标至行尾的命令是"y$"。
map Y y$

"Map ; to : and save a million keystrokes
" ex mode commands made easy 用于快速进入命令行
nnoremap ; :

" Shift+H goto head of the line, Shift+L goto end of the line
"nnoremap H ^
"nnoremap L $

" save
cmap w!! w !sudo tee >/dev/null %

" command mode, ctrl-a to head， ctrl-e to tail
" t_kd代表命令行模式下向下寻找命令, t_ku与之相反
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" 重新激活修改后的vimrc文件
" map R :source $MYVIMRC<CR>

" 取消高亮
noremap <LEADER><CR> :nohlsearch<CR>

set mat=2 
" 隐藏vim的GUI版本中的工具栏
"set guioptions-=T
" 隐藏菜单栏
"set guioptions-=m

" 插件透明背景
let g:SnazzyTransparent = 1

" ============================ Plugins List ============================
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'

" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
"
"" Taglist
"Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
""
"" Error checking
"Plug 'w0rp/ale'
"
"" Auto Complete
"Plug 'Valloric/YouCompleteMe'
"
"" Undo Tree
"Plug 'mbbill/undotree/'
"
"" Other visual enhancement
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'itchyny/vim-cursorword'
"
" Git
"Plug 'rhysd/conflict-marker.vim'
"Plug 'tpope/vim-fugitive'
"Plug 'mhinz/vim-signify'
"Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
"
"" HTML, CSS, JavaScript, PHP, JSON, etc.
"Plug 'elzr/vim-json'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
"Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
"Plug 'mattn/emmet-vim'
"
"" Python
"Plug 'vim-scripts/indentpython.vim'
"
"" Markdown
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
"Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"Plug 'vimwiki/vimwiki'
"
"" Bookmarks
"Plug 'kshenoy/vim-signature'
"
"" Other useful utilities
"Plug 'terryma/vim-multiple-cursors'
"Plug 'junegunn/goyo.vim' " distraction free writing mode
"Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
"Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
"Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
"Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
"
"" Dependencies
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'kana/vim-textobj-user'
"Plug 'fadein/vim-FIGlet'

call plug#end()
"colorscheme snazzy

