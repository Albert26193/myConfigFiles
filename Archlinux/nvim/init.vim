if exists('g:vscode')
    " VSCode extension
		inoremap <silent> jj <Esc>
		set relativenumber
else

" set the code
scriptencoding utf-8
set encoding=utf-8

"=================load the plug===================
call plug#begin('~/.config/vim_plug/plugged')

"terminal下输入nvim,你将看到一个酷酷的启动界面
"Plug 'glepnir/dashboard-nvim'
Plug 'mhinz/vim-startify'

"gruvbox 主题
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'crusoexia/vim-monokai'
Plug 'rakr/vim-one'
Plug 'w0ng/vim-hybrid'

"easymotion
Plug 'easymotion/vim-easymotion'

"change the speed
Plug 'rhysd/accelerated-jk'

"coc
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"overview the code
Plug 'majutsushi/tagbar'

"surround
Plug 'tpope/vim-surround' 

"commenter
Plug 'scrooloose/nerdcommenter'

"markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown',      {'for':['markdown']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for':['markdown']  }
Plug 'mzlogin/vim-markdown-toc',     {'for':['markdown']}

"terminal
Plug 'skywind3000/vim-terminal-help'

"缩进提示
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline-themes'

"彩虹括号
Plug 'luochen1990/rainbow'

"文件树
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

"底部栏
Plug 'vim-airline/vim-airline'

"auto-pairs
Plug 'jiangmiao/auto-pairs'

"高亮
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}
Plug 'RRethy/vim-illuminate'
let g:Hexokinase_highlighters = ['virtual']
let g:Illuminate_delay = 150
hi illuminatedWord cterm=undercurl gui=undercurl

Plug 'sakshamgupta05/vim-todo-highlight'
let g:todo_highlight_config = {
            \   'TODO': {
            \     'gui_fg_color': '#0f0fff',
            \     'gui_bg_color': '#affd3a',
            \   },
            \   'FIXME': {
            \     'gui_fg_color': '#000000',
            \     'gui_bg_color': '#af2d3a',
            \   }
            \}

call plug#end()
"===========================================================以下是具体配置================================================
"-------------------------------------------------------------------------------------------------------------------------

"===============开启界面=====================
"let g:dashboard_default_executive ='clap'

"===============按F3开启文件树================
nnoremap <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"===============overview of the code==========
nmap <F8> :TagbarToggle<CR>


"==============start the themes===============
syntax enable

let g:one_allow_italics = 1
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
" endif


set background=dark " for the dark version
" set background=light " for the light version
colorscheme one
"colorscheme gruvbox
"colorscheme monokai
"colorscheme solarized
"colorscheme hybrid

"+===================== rainbow Parentheses ========================+ "
"((((((()))))))
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs':['yellow', 'orange', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['green', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}


" ==================change the speed=========================
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
let g:accelerated_jk_acceleration_table = [2, 4, 7, 30]

"=====================markdown=============================
" nmap <silent> <F10> <Plug>MarkdownPreview        " 普通模式
" imap <silent> <F10> <Plug>MarkdownPreview        " 插入模式
" nmap <silent> <F9> <Plug>StopMarkdownPreview    " 普通模式
" imap <silent> <F9> <Plug>StopMarkdownPreview    " 插入模式

" +================================ 可视化缩进 =====================================+ "
let g:indent_guides_enable_on_vim_startup = 1  " 默认开启
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 1  " 从第二层开始可视化显示缩进

"================按键映射=====================
"将jj映射到Esc
inoremap <silent> jj <Esc>

" leader to #
" let mapleader="#"

" 分屏窗口移动, Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Go to home and end using capitalized directions
" H和L跳转到行首行末, 实在不想按0和$, 太远
"noremap H ^
"noremap L $

"==================底部栏=====================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1

"=================== easy motion==================
nmap q <Plug>(easymotion-s)

"===============另外的配置======================
" tab map
function! CleverTab()
        if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
                return "\<Tab>"
        else
                return "\<C-N>"
        endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" 设置空白字符的视觉提示
set listchars=eol:~,tab:>.,trail:~,extends:>,precedes:<,space:_

" 高亮当前行
set cursorline

" 高亮匹配括号
set showmatch

" tab 宽度是4
set tabstop=4 "因为有了双宽度"
set noexpandtab

" 显示行号
set number

"双宽度
" set ambiwidth=double 

"显示模式
set showmode

"show the key
set showcmd

"utf-8
set encoding=utf-8

" set 256 colors
set t_Co=256

" check the type
" filetype indent on

" relative number
" set relativenumber

" show the status
set laststatus=2

"show the ruler
set ruler

" show the color when searching
set hlsearch

"set the smart indent
" set smartindent
" set autoindent

" no change the line
" set nowrap
set textwidth=70

":set laststatus=2 "两行状态行+一行命令行
":set cindent "设置c语言自动对齐

""设置可以在VIM使用鼠标
:set mouse=a 

set shiftwidth=4
set softtabstop=4
" ordinary neovim
endif
