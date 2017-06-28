" ==== plug start ====
call plug#begin('$HOME/.config/nvim/plugged')
" golang
Plug 'fatih/vim-go'
Plug 'jstemmer/gotags'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'fatih/molokai'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'ryanoasis/vim-devicons'

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
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'Shougo/unite.vim'
" faster nearly 110~150ms
"Plug 'ianva/vim-youdao-translater', { 'on': ['Ydv', 'Ydc', 'Yde'] }
"Plug 'itchyny/lightline.vim', { 'on': 'AnythingULike' } | Plug 'cocopon/lightline-hybrid.vim', { 'on': 'AnythingULike' } " use an unexist vim command so the plugin will not autoload
Plug 'itchyny/lightline.vim' | Plug 'cocopon/lightline-hybrid.vim' " use an unexist vim command so the plugin will not autoload
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
Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
" mark-signature
Plug 'kshenoy/vim-signature'
" markdown
Plug 'shime/vim-livedown'
" smart input method 输入法
Plug 'ybian/smartim'
" TOC for markdown
Plug 'mzlogin/vim-markdown-toc', { 'on': ['GenTocGFM', 'GenTocRedcarpet'] }
" deoplete
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'on': [] }
Plug 'Shougo/deoplete.nvim'
"command! Deoplete call plug#load('deoplete.nvim') | call deoplete#enable()
call plug#end()
"" ==== plug end ====

" golang
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <Leader>gi <Plug>(go-info)
autocmd FileType go nmap <Leader>gs <Plug>(go-sameids-toggle)
let g:go_auto_type_info = 1
set updatetime=100
"let g:go_auto_sameids = 1

set colorcolumn=80

" deoplete
let g:deoplete#enable_at_startup = 1
" tagbar
let g:tagbar_autofocus = 1
let g:tagbar_width = 50

" NERDTree
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeAutoCenter = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeWinSize = 45

" lightline
"let g:lightline = { 'colorscheme': 'hybrid' }
"let g:lightline_hybrid_style='plain'
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
      \ }
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

let mapleader=';'

" key map
"nnoremap <silent><F3> :Deoplete<CR>
"" ==== YouDao dict ====
vnoremap <silent> <C-Y> :<C-u>Ydv<CR>
nnoremap <silent> <C-Y> :<C-u>Ydc<CR>
nnoremap <leader>yd :<C-u>Yde<CR>
"" ==== YouDao dict ====
" switch highlight search 
"nnoremap <silent><CR> :set hls!<CR>
" switch statusline'display
nnoremap <silent><F10> :call StatusLine()<CR>
function! StatusLine()
    let &laststatus = &laststatus == 2 ? 0 : 2
endfunction
nnoremap <silent><space> :set list!<CR>
nnoremap <silent><C-s> :VimShellPop<CR>
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

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)

nnoremap <leader>gf :GoFmt<CR>
nnoremap <leader>gi :GoImports<CR>
nnoremap <silent><F8> :GundoToggle<CR>
nnoremap <silent><F9> :Startify<CR>
nnoremap <silent><leader>o :only<CR>
nnoremap <leader>a :AirlineToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>Q :qa!<CR>
nnoremap <leader>e :e 
nnoremap <leader>s :so %<CR>
nnoremap <leader>v :echo &
nnoremap <silent><leader>W :w !sudo tee > /dev/null %<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
"nnoremap <silent><up> ddkP
"nnoremap <silent><down> ddp
nnoremap <silent>- dd
nnoremap <silent>J :join!<CR>
nnoremap <leader>m :Man 
nnoremap <leader>he :vert h 
" json format
nnoremap <leader>j :call AllToJson()<CR>
vnoremap <leader>j :'<,'>!python -m json.tool<CR>
function! AllToJson()
	set filetype=json
	%!python -m json.tool
endfunction
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
set autowrite
let g:go_list_type = "quickfix"
set ruler " show current line info in right bottom
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
"set so=10
"function! Scrolloffset()
"    return winheight('%') / 2
"endfunction

"let soo = Scrolloffset()
"set so=&soo
" set sidescrolloff
set nowrap
"set siso=30
set cmdheight=1
"set cursorline
"set cursorcolumn
set nonu
set noacd
"set clipboard+=unnamedplus
set foldcolumn=0
" set tabstop
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set numberwidth=4
set ignorecase
set laststatus=2
set termguicolors
set background=dark
"colorscheme onedark
"colorscheme one
"colorscheme flattened_dark " solarized
"colorscheme flattened_light
"colorscheme paper
"colorscheme lucario
"colorscheme deep-space
"colorscheme dracula
"colorscheme solarized
"let g:solarized_termcolors=256
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
let g:jellybeans_use_term_italics = 1
"let g:jellybeans_overrides = {
"\    'background': { 'guibg': '000000' },
"\}
colorscheme jellybeans

let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

colorscheme deep-space
colorscheme evening


" highlight setting
hi Pmenu ctermfg=black ctermbg=white
hi PmenuSel ctermfg=white ctermbg=lightblue
hi Search ctermfg=white ctermbg=red
hi WildMenu ctermfg=white ctermbg=brown

" highlight linenumber
"""hi clear CursorLine
"""augroup CLClear
"""    autocmd! ColorScheme * hi clear CursorLine
"""augroup END
"""hi CursorLineNR cterm=bold
"""augroup CLNRSet
"""    autocmd! ColorScheme * hi CursorLineNR cterm=bold
"""augroup END


" golang
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>