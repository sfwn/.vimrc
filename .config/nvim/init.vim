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
" Lazily loaded YCM (faster about 200ms)
Plug 'Valloric/YouCompleteMe', { 'on': [] }
command! YcmCompleter call plug#load('YouCompleteMe') | call youcompleteme#Enable() | YcmCompleter
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'Shougo/unite.vim'
" faster nearly 110~150ms
Plug 'ianva/vim-youdao-translater', { 'on': ['Ydv', 'Ydc', 'Yde'] }
Plug 'itchyny/lightline.vim'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'Shougo/vimshell.vim', { 'on': ['VimShellPop', 'VimShell'] }
Plug 'sjl/gundo.vim'
Plug 'crusoexia/vim-dracula'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'tyrannicaltoucan/vim-deep-space'
call plug#end()
"" ==== plug end ====

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
nnoremap <silent><space> :call Hlsearch()<CR>
function! Hlsearch()
	" both ok
	"let &hls = &hls > 0 ? 0 : 1
	set hls!
endfunction
" switch statusline'display
nnoremap <silent><F10> :call StatusLine()<CR>
function! StatusLine()
    let &laststatus = &laststatus == 2 ? 0 : 2
endfunction

nnoremap <silent><C-s> :VimShellPop<CR>
nnoremap <F3> :YcmCompleter<CR>
nnoremap <silent><F4> :NERDTreeToggle<CR>
nnoremap <silent><F5> :TagbarToggle<CR>
nnoremap <silent><F8> :GundoToggle<CR>
nnoremap <silent><F9> :Startify<CR>
nnoremap <silent><leader>o :only<CR>
nnoremap <leader>a :AirlineToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>e :e 
nnoremap <leader>s :so %<CR>
nnoremap <leader>v :echo &
nnoremap <silent><leader>W :w !sudo tee > /dev/null %<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent><up> ddkP
nnoremap <silent><down> ddp
nnoremap <silent>- dd
"nnoremap k kzz
"nnoremap j jzz
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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab


set numberwidth=4
set ignorecase
set laststatus=2
set background=dark
set termguicolors
set background=dark
colorscheme onedark
let g:one_allow_italics=1
"colorscheme deep-space
"colorscheme dracula
"let g:dracula_italic=1

" highlight setting
hi Pmenu ctermfg=black ctermbg=white
hi PmenuSel ctermfg=white ctermbg=lightblue
hi Search ctermfg=white ctermbg=red
hi WildMenu ctermfg=white ctermbg=brown
