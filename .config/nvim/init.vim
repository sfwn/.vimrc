" ==== plug start ====
call plug#begin('$HOME/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim', { 'on': 'GV' }
Plug 'fatih/vim-nginx'
Plug 'uguu-org/vim-matrix-screensaver'
Plug 'TimothyYe/vim-tips'
Plug 'mhinz/vim-startify'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
" Lazily loaded YCM (faster about 200ms)
Plug 'Valloric/YouCompleteMe', { 'on': [] }
command! YcmCompleter call plug#load('YouCompleteMe') | call youcompleteme#Enable() | YcmCompleter
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'Shougo/unite.vim'
" faster nearly 110~150ms
Plug 'ianva/vim-youdao-translater', { 'on': ['Ydv', 'Ydc', 'Yde'] }
Plug 'itchyny/lightline.vim', { 'on': 'AnythingULike' } | Plug 'cocopon/lightline-hybrid.vim', { 'on': 'AnythingULike' } " use an unexist vim command so the plugin will not autoload
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'Shougo/vimshell.vim', { 'on': ['VimShellPop', 'VimShell'] }
Plug 'sjl/gundo.vim'
" colorscheme
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'crusoexia/vim-dracula'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'romainl/flattened'
Plug 'ashfinal/vim-colors-paper'
" mark-signature
Plug 'kshenoy/vim-signature'
" markdown
Plug 'shime/vim-livedown'
call plug#end()
"" ==== plug end ====

" NERDTree
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeAutoCenter = 1
let g:NERDTreeHighlightCursorline = 1
"let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 45

" lightline
let g:lightline = { 'colorscheme': 'hybrid' }
let g:lightline_hybrid_style='plain'

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" key map
"" ==== YouDao dict ====
vnoremap <silent> <C-Y> :<C-u>Ydv<CR>
nnoremap <silent> <C-Y> :<C-u>Ydc<CR>
nnoremap <leader>yd :<C-u>Yde<CR>
"" ==== YouDao dict ====
let mapleader=';'
" switch highlight search 
nnoremap <silent><CR> :set hls!<CR>
" switch statusline'display
nnoremap <silent><F10> :call StatusLine()<CR>
function! StatusLine()
    let &laststatus = &laststatus == 2 ? 0 : 2
endfunction
nnoremap <silent><space> :set list!<CR>

nnoremap <silent><C-s> :VimShellPop<CR>
nnoremap <F3> :YcmCompleter<CR>
nnoremap <silent><F4> :NERDTreeToggle<CR>
nnoremap <silent><leader>n :NERDTreeFind<CR>
nnoremap <silent><F5> :TagbarToggle<CR>

nnoremap <silent><F6> :LivedownToggle<CR>
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1
" the port on which Livedown server will run
let g:livedown_port = 1337
" the system command to launch a browser (ex. on OSX)
" let g:livedown_browser = "open /Applications/Firefox.app"

nnoremap <silent><F8> :GundoToggle<CR>
nnoremap <silent><F9> :Startify<CR>
nnoremap <silent><leader>o :only<CR>
nnoremap <leader>a :AirlineToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>e :e 
nnoremap <leader>s :so %<CR>
nnoremap <leader>v :echo &
nnoremap <silent><leader>W :w !sudo tee > /dev/null %<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent><up> ddkP
nnoremap <silent><down> ddp
nnoremap <silent>- dd
nnoremap <silent>J :join!<CR>
nnoremap <leader>m :Man 
nnoremap <leader>he :vert h 
" json format
vnoremap =j :%!python -m json.tool<CR>
nnoremap =j :%!python -m json.tool<CR>
" tab
nnoremap <C-N> :tabnew<CR>
nnoremap <Right> gt
nnoremap <Left> gT
" Unite
"nnoremap <leader>f :<C-u>Unite -start-insert file<CR>
nnoremap <leader>f :FZF<CR>
call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>r :<C-u>Unite -start-insert file_rec<CR>
nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>

syntax enable
filetype plugin on
if &filetype==""
  setfiletype conf
endif

" system config
set binary
set noeol
set title
set ttyfast
set lazyredraw
set mousehide
" Use these symbols for invisible chars
set listchars=tab:¦\ ,eol:¬,trail:⋅,extends:»,precedes:«

" open file with cursor stay at last closed location
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif   
" set scrolloff
set so=10
"function! Scrolloffset()
"    return winheight('%') / 2
"endfunction

"let soo = Scrolloffset()
"set so=&soo
" set sidescrolloff
set nowrap
"set siso=30
set cmdheight=1
set cursorline
"set cursorcolumn
set nu
set noacd
set clipboard+=unnamedplus
set foldcolumn=0
" set tabstop
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab


set numberwidth=4
set ignorecase
set laststatus=1
set termguicolors
"set background=dark
"colorscheme onedark
"colorscheme solarized
colorscheme flattened_dark
"colorscheme paper
"colorscheme lucario
"colorscheme deep-space
"colorscheme dracula

" highlight setting
hi Pmenu ctermfg=black ctermbg=white
hi PmenuSel ctermfg=white ctermbg=lightblue
hi Search ctermfg=white ctermbg=red
hi WildMenu ctermfg=white ctermbg=brown

" highlight linenumber
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END
hi CursorLineNR cterm=bold
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END