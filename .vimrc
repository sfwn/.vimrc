syntax on

" === plug start ====
call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
call plug#end()
" === plug end ====

" === colortheme ===
colorscheme onedark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " add tmux Tc support
