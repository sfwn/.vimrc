" ==== plug start ====
call plug#begin('$HOME/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ianva/vim-youdao-translater'
Plug 'fatih/vim-nginx'
" Heavy plugins bellow
" Lazily loaded YCM
Plug 'Valloric/YouCompleteMe', { 'on': [] }
command! YcmCompleter call plug#load('YouCompleteMe') | call youcompleteme#Enable() | YcmCompleter
call plug#end()
"" ==== plug end ====

" key map
"" ==== YouDao dict ====
vnoremap <silent> <C-Y> :<C-u>Ydv<CR>
nnoremap <silent> <C-Y> :<C-u>Ydc<CR>
nnoremap <leader>yd :<C-u>Yde<CR>
"" ==== YouDao dict ====
let mapleader=';'
nnoremap <leader>f :YcmCompleter<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :so %<CR>
nnoremap <leader>v :echo &

syntax enable
filetype plugin on
if &filetype==""
  setfiletype conf
endif

" highlight setting
hi Pmenu ctermfg=black ctermbg=white
hi PmenuSel ctermfg=white ctermbg=lightblue
hi Search ctermfg=white ctermbg=red
hi WildMenu ctermfg=white ctermbg=brown

" system config
set clipboard+=unnamedplus
set numberwidth=4
set ignorecase
set laststatus=1
set background=dark
"set termguicolors
