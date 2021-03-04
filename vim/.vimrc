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
"
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"   Config layout:
"   1) Sensible settings             | Settings taken from vim-sensible
"   2) General settings              |
"   3) Plugins                       |
"   4) Plugin Settings               |
"   5) Bindings and remaps           |
"   6) Theme/Appearence              | 
"   7) Commands and Functions        | 
"   8) Snippets                      |
"   9) Vimwiki Settings              |
"  10) Custom Functions              |
"  11) Language Providers
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"------------------------------------------------------------
" Personal Settings
"------------------------------------------------------------
let fullInstall = 1    " If 1 will install all fonts, themes, plugins etc. If 0 will do minimal install
let workConfig = 1     " If personal or work config
" Check if NeoVim or Vim use - `if has('nvim')
" Check if GUI or TUI/CLI - `if has('gui')
" Checking for OS has(), with unix or win32
" General other checks, see `:help feature-list`
"
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
let mapleader="\<Space>"
let maplocalleader=","
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

set norelativenumber  "Show how far away lines are
set number          "Show current line number
set nowrap            "Dont Wrap lines
set showmatch       "When bracket is inserted show matching one
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
set gdefault            " Always substitute all matches in a line

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4

set expandtab       " On pressing tab, insert 4 spaces
set smarttab        " Enable smart-tabs
set softtabstop=2   " let backspace delete indent

set linebreak       " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=100   " Line wrap (number of cols)

set visualbell      " Use visual bell (no beeping)

set ruler           " Show row and column ruler information

" Set splits to open like expected
set splitbelow
set splitright
" allow copy/paste from vim<-->computer
if has('win32')
    set clipboard=unnamed
endif
if has('linux')
    set clipboard+=unnamedplus 
endif
" Set simba files to be read as pascal
au BufRead,BufNewFile *.simba set filetype=pascal
set mouse=a " Enable mouse support everywhere, see :help mouse for options
" Vim Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w> <C-\><C-n><C-w>
"------------------------------------------------------------
" Plugins
"------------------------------------------------------------
call plug#begin()
Plug 'Raimondi/delimitMate'
"Plug 'kien/ctrlp.vim'
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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mbbill/undotree'
Plug 'lifepillar/vim-solarized8'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
 
" LuaRocks
Plug 'nvim-lua/plenary.nvim'

" Custom UI
Plug 'skywind3000/vim-quickui'
Plug 'liuchengxu/vim-which-key'
" Plug 'unite'
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
 Plug 'roxma/vim-hug-neovim-rpc'
endif

" Smybols and syling
Plug 'arthurxavierx/vim-unicoder'

" Custom help plugin
if has('win32')
    Plug '~/Documents/myhelp'
endif 

" Themes
Plug 'morhetz/gruvbox'
if fullInstall
    Plug 'zefei/simple-dark'
    Plug 'dikiaap/minimalist'
    Plug 'rakr/vim-one'
    Plug 'jscappini/material.vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'dracula/vim'
    Plug 'haishanh/night-owl.vim'
endif

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
if workConfig
    let $GIT_SSL_NO_VERIFY = 'true'
endif

" Disable 'Press ? for Help' in NERDTree
let NERDTreeMinimalUI=1 

" Allow ctrlp to find all files
"let g:ctrlp_max_files=2000

"------------------------------------------------------------
" Bindings and remaps
"------------------------------------------------------------
map <C-n> :NERDTreeToggle <CR>
"map <C-b> :CtrlP <CR>
map <C-p> :FZF <CR>
map <C-m> :Tagbar <CR>

" Tab mappings
map <C-t>n :tabnew<CR>
map <C-t>x :tabclose<CR>
map <C-t>l :tabn<cr>
map <C-t>h :tabr<cr>
map <C-t>j :tabl<cr>
map <C-t>k :tabp<cr>

" Editing mappings
" | Key Mode  |  Mapping | Description |
" --------------------------------------
" |  Normal   | <ctrl>+d | Delete line |
inoremap <c-d> <c-o>dd
" | Normal    | <space>  | Select word |
"nnoremap <space> viw

" Right click context menu popup
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>

" Trigger configuration for UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Tagbar config
"let g:tagbar_ctags_bin="C:/Users/jmoriar2/Documents/Programs/Neovim/ctags/"

" hit space twice to open menu
"map <leader>m :call quickui#menu#open()<cr>
"nnoremap <silent> <leader> :WhichKey ','<CR>
"map <space><space> :call quickui#menu#open()<cr>
map <Leader>m :call quickui#menu#open()<cr>

" Denite keys and define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

"------------------------------------------------------------
" Theme/Appearence
"------------------------------------------------------------
set t_Co=256
colorscheme dracula
"colorscheme minimalist
"colorscheme gruvbox

hi CursorLineNr guifg=Orange gui=bold

" QuickUI Theme
"let g:quickui_color_scheme = 'gruvbox'
" GUI mode settings
if exists('g:GuiLoaded')
    set guifont=Source_Code_Pro:h10:cANSI:qDRAFT
endif

if workConfig
    " This should probably be behind a GUI check but isn't working
    autocmd VimEnter * GuiPopupmenu 0
endif

set guifont=FiraCode\ Nerd\ Font:h10
"set guifont=Hack:h10

let g:quickui_show_tip = 1
let g:quickui_border_style = 2

let g:NERDTreeFileExtensionHighlightFullName = 1

" autocmd filetype nerdtree highlight haskell_icon ctermbg=none ctermfg=Red guifg=#ffa500
" autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Red guifg=#ffa500
" autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Red guifg=#ffa500
" autocmd filetype nerdtree highlight python_icon ctermbg=none ctermfg=Red guifg=#ffa500
"
" autocmd filetype nerdtree syn match haskell_icon ## containedin=NERDTreeFile
" autocmd filetype nerdtree syn match html_icon ## containedin=NERDTreeFile,html
" autocmd filetype nerdtree syn match go_icon ## containedin=NERDTreeFile

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg)
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:bg .' guifg='. a:fg
endfunction
function! NERDTreeHighlightFileNoBackground(extension, fg)
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermfg='. a:fg .' guifg='. a:fg
endfunction

call NERDTreeHighlightFile('jade', 'green', 'black')
call NERDTreeHighlightFile('html', 'green', 'black')
call NERDTreeHighlightFile('styl', 'green', 'black')
call NERDTreeHighlightFile('css', 'green', 'black')
call NERDTreeHighlightFile('coffee', 'cyan', 'black')
call NERDTreeHighlightFileNoBackground('py', 'green')
call NERDTreeHighlightFileNoBackground('md', 'green')

"------------------------------------------------------------
" Commands and Functions
"-----------------------------------------------------------
if ! exists('*VimConfig')
    function VimConfig()
        :e $MYVIMRC
    endfunction
endif

if ! exists('*VimConfigReload')
    function VimConfigReload()
        source $MYVIMRC
    endfunction
endif

if ! exists('*MyHelp')
    function MyHelp()
        echo "+------------------------------------------+ \n|                                          | \n|                                          | \n|              Cheat Sheets                | \n|                                          | \n|                                          | \n+------------------------------------------+"
    endfunction
endif 

command! Vimconfig call VimConfig()
command! Vimconfigreload call VimConfigReload()
command! MyHelp call MyHelp()

" cd $HOME

"------------------------------------------------------------
" Snippets
"------------------------------------------------------------


"------------------------------------------------------------
" Vimwiki Settings
"------------------------------------------------------------
" Use markdown
let g:vimwiki_list = [{'path': '~/vimwiki',
                       \ 'syntax': 'markdown', 'ext': '.md'}]

set concealcursor=n
set conceallevel=2
"hi AsteriskBold  cterm=bold gui=bold
syn match RedWiki contained "<red></red>" conceal                                      
"syn match AsteriskBold "\\\@<!\*\*[^"*|]\+\*\*" contains=Asterisks
hi Asterisks NONE
syn match Asterisks contained "**" conceal 

"hi pyKeyword ctermfg=green guifg=green
"hi FancySymbols ctermfg=green guifg=green
"syntax keyword pyKeyword alpha conceal cchar=a
"syntax keyword pyKeyword alpha conceal cchar="test"
"syntax keyword pyKeyword ALPHA conceal cchar=α
"syntax keyword pyKeyword Gamma conceal cchar=Γ
"syntax keyword pyConstant None conceal cchar=∅
"syn match ArrowHead contained ">" conceal cchar=▶
"syn match ArrowTail contained "-" conceal cchar=─
"syn match ArrowFull "->" contains=ArrowHead,ArrowTail

"" remove the keywords. we'll re-add them below
"syntax clear pythonOperator

"syntax match pythonOperator "\<is\>"

"syntax match pyNiceOperator "\<in\>" conceal cchar=∈
"syntax match pyNiceOperator "\<or\>" conceal cchar=∨
"syntax match pyNiceOperator "\<and\>" conceal cchar=∧
"" include the space after “not” – if present – so that “not a” becomes “¬a”.
"" also, don't hide “not” behind  ‘¬’ if it is after “is ”.
"syntax match pyNiceOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=¬
"syntax match pyNiceOperator "\<not in\>" conceal cchar=∉
"syntax match pyNiceOperator "<=" conceal cchar=≤
"syntax match pyNiceOperator ">=" conceal cchar=≥
"" only conceal “==” if alone, to avoid concealing SCM conflict markers
"syntax match pyNiceOperator "=\@<!===\@!" conceal cchar=≡
"syntax match pyNiceOperator "!=" conceal cchar=≢
"syntax keyword pyNiceOperator sum conceal cchar=∑
"syntax match pyNiceOperator "\<\%(math\.\)\?sqrt\>" conceal cchar=√
"syntax match pyNiceKeyword "\<\%(math\.\)\?pi\>" conceal cchar=π
"syntax keyword pyNiceStatement lambda conceal cchar=λ

"hi link pyNiceOperator Operator
"hi link pyNiceStatement Statement
"hi link pyNiceKeyword Keyword
"hi! link Conceal Operator
 
"------------------------------------------------------------
" Custom Functions
"------------------------------------------------------------
" For buffer info https://vim.fandom.com/wiki/Vim_buffer_FAQ
function! CustomDisplay()
    "let t=[] | %s/test.*/\=add(t,submatch(1))[1:0]/g
    "echom t
    vnew

    setlocal filetype=CustomDisplay 

    setlocal noreadonly " in case the "view" mode is used
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal nobuflisted
    setlocal nomodifiable
    setlocal textwidth=0
endfunction
command! CustomDisplay call CustomDisplay()

" display vim messages in the textbox
function! DisplayMessages()
    let x = ''
    redir => x
    silent! messages
    redir END
    let x = substitute(x, '[\n\r]\+\%$', '', 'g')
    let content = filter(split(x, "\n"), 'v:key != ""')
    let opts = {"close":"button", "title":"Vim Messages"}
    call quickui#textbox#open(content, opts)
endfunc 

" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.

call quickui#menu#install('&File', [
            \ [ "&New File\t:new", ':new' ],
            \ [ "&Close", ':q' ],
            \ [ "--", '' ],
            \ [ "&Save\t:w", ':w'],
            \ [ "Save &As", ':w' ],
            \ [ "Save All", 'echo 5' ],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'echo 6' ],
            \ ]) 

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&Find', 'echo 3', 'help 3' ],
            \ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Plugins", [
            \ ['NERDTree', ':NERDTreeToggle'],
            \ ['Tagbar', ':Tagbar'],
            \ [ "--", '' ],
            \ ])

call quickui#menu#install("&VimWiki", [
            \ ['Goto &Home', ':VimwikiIndex'],
            \ ['&Search', ':VimwikiSearch /input()/'],
            \ [ "--", '' ],
            \ ])

call quickui#menu#install("&Text", [
            \ ['Format &JSON', ':%!python -m json.tool'],
            \ ['Format &XML', ':%!python -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"'],
            \ [ "--", '' ],
            \ ['&Sort', ':sort'],
            \ ['Remove &EmptyLines', ':g/^$/d'],
            \ ['Remove Empty&TabLines', ':g/\t$/d'],
            \ [ "--", '' ],
            \ ['Base64 Encode', ':%!python -m base64 -e'],
            \ ['Base64 Decode', ':%!python -m base64 -d']
            \ ]) 

" register HELP menu with weight 10000
"call quickui#menu#install('H&elp', [
            "\ ["&Cheatsheet", 'help index', ''],
            "\ ['T&ips', 'help tips', ''],
            "\ ['--',''],
            "\ ["&Tutorial", 'help tutor', ''],
            "\ ['&Quick Reference', 'help quickref', ''],
            "\ ['&Summary', 'help summary', ''],
            "\ ], 10000) 

let g:airline#extensions#tabline#enabled = 1
" display buffers with :ls :b
" or :b <tab>

"------------------------------------------------------------
" Language Providers
"------------------------------------------------------------
" Information
" Neovim supports
"   - VimScript
"   - Lua
"   - Python (Provider)
"   - Ruby (Provider)
"   - Nodejs (Provider)
"   - Other languages thru API msgpack (Go, Kotlin)
" Neovim dosn't support vim's:
"   - Perl
"   - TCL

" Use plenary with nvim 0.5+
if has('nvim-0.5')
lua << EOF
local neorocks = require("plenary.neorocks")
-- neorocks.install('penlight', 'pl')

--   package_name : str             - Name of the package for luarocks
--   lua_name     : (optional) str  - Name of the package that you can require. Used to determine if we have it installed already (not from luarocks)
-- neorocks.ensure_installed('penlight', 'pl')
-- neorocks.ensure_installed('lua-cjson', 'cjson')
EOF
endif
