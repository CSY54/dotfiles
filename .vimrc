" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Nerdtree related
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'

" Lightline related
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'

" Colorscheme
Plugin 'joshdick/onedark.vim'

" Syntax Highlighting
" Plugin 'sheerun/vim-polyglot'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'jelera/vim-javascript-syntax'
" Plugin 'posva/vim-vue'
" Plugin 'leafOfTree/vim-vue-plugin'
" Plugin 'udalov/kotlin-vim'
" Plugin 'digitaltoad/vim-pug'

" Unit Testing
Plugin 'vim-test/vim-test'

" Coding Utils
Plugin 'Yggdroot/indentLine'
Plugin 'luochen1990/rainbow'
Plugin 'alvan/vim-closetag'
Plugin 'zxqfl/tabnine-vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dense-analysis/ale'

call vundle#end()
filetype plugin indent on

" for file highlighting
" au BufRead,BufNewFile *.vue set filetype=typescript
" au BufRead,BufNewFile *.ejs set filetype=html
" au BufRead,BufNewFile *.ino set filetype=cpp

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

" different setting for different language
au Filetype c,cpp setlocal ts=4 sw=4 sts=4 noexpandtab
au Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab

syntax enable
syntax on

let t:is_transparent_background=1
fu! Change_Background()
  if t:is_transparent_background == 0
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent_background=1
  else
    colors onedark 
    let t:is_transparent_background=0
  endif
endf
nnoremap <F1> :call Change_Background()<CR>

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
    call append(11, "\tIO;")
    call append(12, "")
    call append(13, "\treturn 0;")
    call append(14, "}")
  endif
endf

" onedark lightline config
let g:lightline = {
\ 'colorscheme': 'onedark',
\ 'active': {
\   'left': [
\     [ 'mode', 'paste' ],
\     [ 'gitbranch', 'readonly', 'filename', 'modified' ]
\   ],
\   'right': [ 
\     [ 'lineinfo' ],
\     [ 'percent' ],
\     [ 'fileformat', 'fileencoding', 'filetype' ] 
\   ]
\ },
\ 'component_function': {
\   'gitbranch': 'gitbranch#name',
\   'fileformat': 'LightlineFileformat',
\   'fileencoding': 'LighterFileencoding',
\   'filetype': 'LightlineFiletype'
\ }
\ }

fu! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfu

fu! LightlineFileencoding()
  return winwidth(0) > 70 ? &fileencoding : ''
endfu

fu! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfu

" setup colorscheme
colorscheme onedark

" fuck arrow key
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" no shift needed
nnoremap ; :
" Disable recording and map it to quit
nnoremap <silent>q :q<CR>
nnoremap <silent>Q :q!<CR>

" coding utils
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap ' ''<ESC>i
" inoremap \" \""<ESC>i
" inoremap {<CR> {<CR>}<ESC>O

" C++ / Python utils
" TODO: compile according to filetype
nnoremap <F7> <ESC>:w<CR>:!python %<CR>
nnoremap <F8> <ESC>:w<CR>:!python3 %<CR>
nnoremap <F9> <ESC>:w<CR>:!g++ -std=c++14 -O2 -Wall -Wextra -Wshadow %<CR>
nnoremap <F10> :!./a.out<CR>
nnoremap <F11> :!./a.out < in<CR>
nnoremap <F12> :!kotlinc % -include-runtime -d out.jar && echo "Compile finished" && java -jar out.jar<CR>

" for pane moving
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p " Open on startup and focus on the opened file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close on exit
" let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] " Ignore files in NERDTree
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

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
" let g:closetag_html_style='*.html,*.xhtml,*.phtml,*.ejs,*.vue'
" let g:closetag_filetypes='html,xhtml,phtml,ejs,vue'

" cpp enhanced highlight
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1
let g:cpp_posix_standard=1
let g:cpp_concepts_highlight=1
let c_no_curly_error=1

" wildfire
map <SPACE> <Plug>(wildfire-fuel)
" vmap <C-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = {
\   "*" : ["i'", 'i"', "i)", "i]", "i}"],
\   "html,xml" : ["at", "it"],
\ }

" gundo
if has('python3')
  let g:gundo_prefer_python3=1
endif
nnoremap <leader>h :GundoToggle<CR>

" ale
let g:ale_linters = {
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier']
\ }
" ale navigation
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
let g:ale_sign_column_always = 1
" lint only on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
" for Vue
let b:ale_linter_aliases = ['javascript', 'vue']

" Problem with vue highlighting
" https://github.com/sheerun/vim-polyglot/issues/292
let g:polyglot_disabled = ['coffee-script']
