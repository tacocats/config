"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
"  ▄▄▄██▀▀▀▄▄▄       ▄████▄   ██ ▄█▀
"    ▒██  ▒████▄    ▒██▀ ▀█   ██▄█▒ 
"    ░██  ▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ 
" ▓██▄██▓ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ 
"  ▓███▒   ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄
"  ▒▓▒▒░   ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒
"  ▒ ░▒░    ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░
"  ░ ░ ░    ░   ▒   ░        ░ ░░ ░ 
"  ░   ░        ░  ░░ ░      ░  ░   
"                  ░               
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
" 	Config layout:
"	1) Sensible settings             | Settings taken from vim-sensible
"	2) General settings              | 
"	3) Plugins						 | 
"	4) Plugin Settings				 | 
"	5) Bindings and remaps			 |
"	6) Theme/Appearence				 |	
"	7) Commands and Functions		 |	
"	8) Snippets						 | 
"
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

"------------------------------------------------------------
" Sensible settings
" https://raw.githubusercontent.com/tpope/vim-sensible/master/plugin/sensible.vim
"------------------------------------------------------------
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
syntax enable
filetype plugin indent on
set nrformats-=octal
set incsearch
set display+=lastline
set autoread
if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
set viewoptions-=options

"------------------------------------------------------------
" General settings
"------------------------------------------------------------
let mapleader=","

"set relativenumber  "Show how far away lines are
set number 		    "Show current line number
set wrap			"Wrap lines
set showmatch 		"When bracket is inserted show matching one
set hidden " hide buffers, not close them

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" Set encoding
set encoding=utf-8
scriptencoding utf-8

" lazy file name tab completion
set wildmode=longest,list,full
set wildmenu
set wildignorecase

" ignore files vim doesnt use for lazy file completion
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

" case insensitive search
set ignorecase
set smartcase
set infercase

" searching
set hlsearch
set incsearch
set gdefault			" Always substitute all matches in a line


" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4

set expandtab 		" On pressing tab, insert 4 spaces
set smarttab		" Enable smart-tabs
set softtabstop=2 	" let backspace delete indent

set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)

set visualbell		" Use visual bell (no beeping)

set ruler			" Show row and column ruler information

"------------------------------------------------------------
" Plugins
"------------------------------------------------------------
call plug#begin()
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/rainbow_parentheses.vim'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'vimwiki/vimwiki'
Plug 'vim-vdebug/vdebug'

" Themes
Plug 'dikiaap/minimalist'

" Plug 'kassio/neoterm'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'andreyorst/SimpleSnippets.vim'
" Plug 'andreyorst/SimpleSnippets-snippets'
" Plug 'mhinz/vim-startify'
" Plug 'Shougo/neocomplcache'
" Plug 'skywind3000/asyncrun.vim'

" Vim math stuff
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'plasticboy/vim-markdown'

" Vim Help and Cheat Sheet
" Plug '~/plugged/myhelp'
call plug#end()

"------------------------------------------------------------
" Plugin Settings
"------------------------------------------------------------
" Allow vim-airline to show
set laststatus=2

" Smarter tab lines
let g:airline#extensions#tabline#enabled = 1

" Vim rainbow-brackets settings 
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Need this for work. SSL won't verify behind a firewall.
let $GIT_SSL_NO_VERIFY = 'true'

" Vimwiki settings
let g:vimwiki_list = [{'path': '~/vimwiki',
                       \ 'syntax': 'markdown', 'ext': '.md'}]


"------------------------------------------------------------
" Bindings and remaps
"------------------------------------------------------------
map <C-n> :NERDTreeToggle <CR>
map <C-b> :CtrlP <CR>

"------------------------------------------------------------
" Theme/Appearence
"------------------------------------------------------------
set t_Co=256
colorscheme minimalist

" GUI mode settings
if has('gui_running')
    set guifont=Source_Code_Pro:h10:cANSI:qDRAFT
endif

"------------------------------------------------------------
" Commands and Functions
"------------------------------------------------------------
" Assume windows w/ no WSL access. NeoVim
command Vimconfig :e C:/Users/jmoriar2/AppData/Local/nvim"

"------------------------------------------------------------
" Snippets
"------------------------------------------------------------
