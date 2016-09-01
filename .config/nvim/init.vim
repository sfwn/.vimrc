" ==== plug start ====
call plug#begin('$HOME/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'ianva/vim-youdao-translater'
Plug 'fatih/vim-nginx'
" Heavy plugins bellow
Plug 'Valloric/YouCompleteMe'
call plug#end()
"" ==== plug end ====

" key map
"" ==== YouDao dict ====
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>
"" ==== YouDao dict ====
let mapleader=';'
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
