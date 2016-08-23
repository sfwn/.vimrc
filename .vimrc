syntax on

if !exists("g:syntax_on")
    syntax enable
endif

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
filetype plugin indent on


" 设置快捷键将选中文本块复制至系统剪贴板
noremap <leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <leader>p "+p
" " 定义快捷键关闭当前分割窗口
nmap <leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>


set updatetime=250
set foldmethod=syntax
set foldenable
set encoding=utf-8
set showmatch
set matchtime=1
set autoread
set autochdir
set nowrap
set cursorline
set nocursorcolumn
set hls
set incsearch
set backspace=2
set ruler 
set number
set numberwidth=3
set tabstop=4
set showcmd
set wildmenu
set nocompatible
set ignorecase

let mapleader=';'

" Highlight current line
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline "cursorcolumn


" === plug start ====
call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-run-interactive'
Plug 'tpope/vim-rails'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'benmills/vimux'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
call plug#end()
" === plug end ====

" === colortheme ===
set termguicolors
set background=dark
"colorscheme onedark
colorscheme deep-space


" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open a NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <leader>t :TagbarToggle<CR>

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
	if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor
	"     " Use ag in CtrlP for listing files.
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	" Ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif

" vim-airline
let g:airline_powerline_fonts = 1
set laststatus=2 " Always display the status line
set statusline+=%{fugitive#statusline()} "  Git Hotness
" vim-airline theme
let g:solarized_base16 = 1

" 牛
" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


map <silent><leader>vv :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <silent><leader>vl :VimuxRunLastCommand<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <silent><leader>vq :VimuxCloseRunner<CR>

" lightline is better than powerline & airline
