" ==== plug start ====
call plug#begin('$HOME/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
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
call plug#end()
"" ==== plug end ====

" lightline
let g:lightline = { 'colorscheme': 'hybrid' }
let g:lightline_hybrid_style='plain'

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
	let &hls = &hls > 0 ? 0 : 1
endfunction

nnoremap <F3> :YcmCompleter<CR>
nnoremap <silent><F4> :NERDTreeToggle<CR>
nnoremap <silent><F5> :TagbarToggle<CR>
nnoremap <leader>a :AirlineToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>e :e 
nnoremap <leader>s :so %<CR>
nnoremap <leader>v :echo &
nnoremap <silent><leader>W :w !sudo tee > /dev/null %<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" tab
nnoremap <C-N> :tabnew<CR>
nnoremap <Right> gt
nnoremap <Left> gT
" Unite
nnoremap <leader>f :<C-u>Unite -start-insert file<CR>
nnoremap <leader>r :<C-u>Unite -start-insert file_rec<CR>

syntax enable
filetype plugin on
if &filetype==""
  setfiletype conf
endif

" system config
" open file with cursor stay at last closed location
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif   
set so=10
"set cmdheight=1
set clipboard+=unnamedplus
set foldcolumn=1
set tabstop=4
set numberwidth=4
set ignorecase
set laststatus=2
set background=dark
set termguicolors
set background=dark
colorscheme onedark

" highlight setting
hi Pmenu ctermfg=black ctermbg=white
hi PmenuSel ctermfg=white ctermbg=lightblue
hi Search ctermfg=white ctermbg=red
hi WildMenu ctermfg=white ctermbg=brown
