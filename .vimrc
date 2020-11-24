" vim-plug start
call plug#begin('~/.vim/plugged')

" Coding Utils
Plug 'luochen1990/rainbow'
Plug 'alvan/vim-closetag'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'alvan/vim-closetag'
" Plug 'zxqfl/tabnine-vim'
Plug 'gcmt/wildfire.vim'
" Plug 'sjl/gundo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'

" Coc
Plug 'neoclide/coc.nvim'

" Nerdtree related
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Colorscheme
Plug 'joshdick/onedark.vim'

" Lightline related
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
Plug 'maximbaz/lightline-trailing-whitespace'

" Syntax Highlighting
" Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jelera/vim-javascript-syntax'
" Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'udalov/kotlin-vim'
Plug 'digitaltoad/vim-pug'
Plug 'iloginow/vim-stylus'
" Plug 'ollykel/v-vim'
Plug 'jwalton512/vim-blade'

" Unit Testing
" Plug 'vim-test/vim-test'

" Game WTF
Plug 'johngrib/vim-game-snake'

" Waka-waka
Plug 'wakatime/vim-wakatime'

call plug#end()
filetype plugin indent on

" for file highlighting
" au BufRead,BufNewFile *.vue set filetype=typescript
" au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.ino set filetype=cpp
au BufRead,BufNewFile *.sage set filetype=python

set nu rnu
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
set title
" Taken from coc
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
syntax enable
syntax on

" different setting for different language
au Filetype c,cpp setlocal ts=4 sw=4 sts=4 noexpandtab
au Filetype javascript,vue setlocal ts=2 sw=2 sts=2 expandtab

if has("termguicolors")
 set termguicolors
endif

if has('nvim')
  let s:editor_root=expand("~/.config/nvim")
else
  let s:editor_root=expand("~/.vim")
endif

" setup colorscheme
colorscheme onedark

" transparent background
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

" default code for .cpp file
" code snippets?
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

" Lightline ALE
let g:lightline#ale#indicator_checking = " "
let g:lightline#ale#indicator_warnings = ""
let g:lightline#ale#indicator_errors = "✗"
let g:lightline#ale#indicator_ok = "✓"

" onedark lightline config
let g:lightline = {
\ 'colorscheme': 'onedark',
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' },
\ 'active': {
\   'left': [
\     [ 'mode', 'paste' ],
\     [ 'gitbranch', 'readonly', 'filename', 'modified' ]
\   ],
\   'right': [ 
\     [ 'percent', 'lineinfo' ],
\     [ 'fileformat', 'fileencoding', 'filetype' ],
\     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'trailing' ]
\   ]
\ },
\ 'tabline': {
\   'left': [ [ 'buffers' ] ],
\   'right': [ [ 'close' ] ]
\ },
\ 'component_expand': {
\   'buffers': 'lightline#bufferline#buffers',
\   'trailing': 'lightline#trailing_whitespace#component',
\   'linter_checking': 'lightline#ale#checking',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok'
\ },
\ 'component_type': {
\   'buffers': 'tabsel',
\   'trailing': 'error',
\   'linter_checking': 'right',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\   'linter_ok': 'right'
\ },
\ 'component_function': {
\   'readonly': 'LightlineReadonly',
\   'gitbranch': 'gitbranch#name'
\ }
\ }

" Lightline ALE

let g:lightline#ale#indicator_warnings = ' '
let g:lightline#ale#indicator_errors = ' '
let g:lightline#ale#indicator_checking = ' '
let g:lightline#ale#indicator_ok = " "

fu! LightlineReadonly()
  return &readonly ? '' : ''
endfu

" Lightline Buffer
" always show the tabline
set showtabline=2
let g:lightline#bufferline#filename_modifier = ':~:.'
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#number_map = {
\ 0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
\ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉'}

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

" Lightline Trailing Whitespace
let g:lightline#trailing_whitespace#indicator = '•'

" fuck arrow key
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" no shift needed
nnoremap ; :
" Disable recording and map it to quit
" nnoremap <silent>q :q<CR>
" nnoremap <silent>Q :q!<CR>

" coding utils
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap ' ''<ESC>i
" inoremap \" \""<ESC>i
" inoremap {<CR> {<CR>}<ESC>O

" C++ / Python utils
" TODO: compile according to filetype
nnoremap <F6> <ESC>:w<CR>:!Rscript %<CR>
nnoremap <F7> <ESC>:w<CR>:!python %<CR>
nnoremap <F8> <ESC>:w<CR>:!python3 %<CR>
nnoremap <F9> <ESC>:w<CR>:!g++ -std=c++17 -O2 -Wall -Wextra -Wshadow %<CR>
nnoremap <F10> :!./a.out<CR>
nnoremap <F11> :!./a.out < in<CR>
nnoremap <F12> :!kotlinc % -include-runtime -d out.jar && echo "Compile finished" && java -jar out.jar<CR>

" for pane moving
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

let g:NERDTreeGitStatusUseNerdFonts = 1
" NERDTree
noremap <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p " Open on startup and focus on the opened file
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close on exit
" let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] " Ignore files in NERDTree
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

" https://github.com/preservim/nerdtree/issues/815
augroup nerdtree
  autocmd!
  autocmd FileType nerdtree syntax clear NERDTreeFlags
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
  autocmd FileType nerdtree setlocal conceallevel=3
  autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END

" let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

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
set list lcs=tab:\|\ ,trail:·

" onedark colorscheme 
let g:onedark_termcolors=256

" rainbow
let g:rainbow_active=1

" closetag
let g:closetag_html_style='*.html,*.xhtml,*.phtml,*.ejs,*.vue'
let g:closetag_filetypes='html,xhtml,phtml,ejs,vue'

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

" vue
let g:vue_pre_processors = ['pug']

" ale
let g:ale_linters = {
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier']
\ }
let g:ale_linters_explicit = 1
" ale navigation
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
let g:ale_sign_column_always = 1
" lint only on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''
" for Vue
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}

" Problem with vue highlighting
" https://github.com/sheerun/vim-polyglot/issues/292
let g:polyglot_disabled = ['coffee-script']

" configure for nvim
let g:python_host_prog = '~/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'

" coc
let g:coc_status_error_sign = 'x'
" <TAB> navigation
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
