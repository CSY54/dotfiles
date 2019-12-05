" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'itchyny/lightline.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'luochen1990/rainbow'
Plugin 'alvan/vim-closetag'
Plugin 'joshdick/onedark.vim'
Plugin 'zxqfl/tabnine-vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'

call vundle#end()
filetype plugin indent on

" for vue highlighting
au BufRead,BufNewFile *.vue set filetype=typescript

set nu rnu
set ai
set mouse=a
set nowrap
set ruler cursorline
set bg=dark
set autoindent smartindent cindent
set expandtab smarttab
set sw=2 sts=2 ts=2
set laststatus=2
set backspace=2
set scrolloff=5
set encoding=utf-8
set clipboard=unnamed
set fileformat=unix
set hls showmatch incsearch ignorecase smartcase
set splitbelow splitright
set noshowmode
set wildmenu

" set gui options for mvim
set guicursor+=a:blinkon0

syntax enable
syntax on

autocmd FileType cpp call DefaultCode()
fu! DefaultCode()
  if line("$") == 1
    call append(0, "#include <bits/stdc++.h>")
    call append(1, "#define IO ios::sync_with_stdio(0);cin.tie(0)")
    call append(2, "#define endl '\\n'")
    call append(3, "#define MAXN maxn")
    call append(4, "")
    call append(5, "using namespace std;")
    call append(6, "")
    call append(7, "")
    call append(8, "")
    call append(9, "signed main()")
    call append(10, "{")
    call append(11, "  IO;")
    call append(12, "")
    call append(13, "  return 0;")
    call append(14, "}")
  endif
endf

" onedark lightline config
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" setup colorscheme
colorscheme onedark

" fuck arrow key
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" no shift needed
nnoremap ; :
nnoremap <silent> q :q<CR> " Disable recording and map it to quit
nnoremap <silent> Q :q!<CR>

" coding utils
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap ' ''k<ESC>i
" inoremap \" \""<ESC>i
inoremap {<CR> {<CR>}<ESC>O

" C++ / Python utils
nnoremap <F7> <ESC>:w<CR>:!python %<CR>
nnoremap <F8> <ESC>:w<CR>:!python3 %<CR>
nnoremap <F9> <ESC>:w<CR>:!g++ -std=c++14 -O2 -Wall -Wextra -Wshadow %<CR>
nnoremap <F10> :!./a.out<CR>
nnoremap <F11> :!./a.out < in<CR>

" for pane moving
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p " Open on startup and focus on the opened file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close on exit
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] " Ignore files in NERDTree
let NERDTreeMinimalUI=1

" NERDCommenter
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign='left'
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1

" Indent Guide
" let g:indentLine_setColors = 0
let g:indentLine_char_list=['|', '¦', '┆', '┊']

" onedark colorscheme 
let g:onedark_termcolors=256

" rainbow
let g:rainbow_active=1

" closetag
let g:closetag_html_style='*.html,*.xhtml,*.phtml,*.ejs)'
let g:closetag_filetypes='html,xhtml,phtml,ejs'

" cpp enhanced highlight
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1
let g:cpp_posix_standard=1
let g:cpp_concepts_highlight=1
let c_no_curly_error=1

" wildfire
map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}"],
    \ "html,xml" : ["at", "it"],
\ }

" gundo
if has('python3')
    let g:gundo_prefer_python3=1
endif
nnoremap <leader>h :GundoToggle<CR>

