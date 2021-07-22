" configuration for nvim
" :checkhealth
" let g:python_host_prog='~/.pyenv/versions/neovim2/bin/python'
" let g:python3_host_prog='~/.pyenv/versions/neovim3/bin/python'
" let g:ruby_host_prog='/usr/local/bin/neovim-ruby-host'


let g:ale_disable_lsp = 1


call plug#begin('~/.vim/plugged')

" colorscheme
Plug 'joshdick/onedark.vim'


" coding utils
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
" Plug 'gcmt/wildfire.vim' " not yet
" Plug 'sjl/gundo.vim' " not yet
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " not yet
" Plug 'junegunn/fzf.vim' " not yet


" nerdtree related
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


" lightline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
Plug 'maximbaz/lightline-trailing-whitespace'


" language specific
" Plug 'alvan/vim-closetag', { 'for': ['html', 'ejs', 'vue', 'blade'] }
" Plug 'editorconfig/editorconfig-vim'
" Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
" Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" Plug 'posva/vim-vue', { 'for': 'vue' }
" Plug 'leafOfTree/vim-vue-plugin', { 'for': 'vue' }
" Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
" Plug 'digitaltoad/vim-pug', { 'for': ['pug', 'vue'] }
" Plug 'ollykel/v-vim', { 'for': 'v' }
" Plug 'jwalton512/vim-blade', { 'for': 'blade' }
" Plug 'nikvdp/ejs-syntax', { 'for': 'ejs' }
" Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
" Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" for laravel
" Plug 'tpope/vim-dispatch', { 'for': 'php' }
" Plug 'tpope/vim-projectionist', { 'for': 'php' }
" Plug 'noahfrederick/vim-composer', { 'for': 'php' }
" Plug 'noahfrederick/vim-laravel', { 'for': 'php' }

" coc
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'neoclide/coc-eslint', { 'do': 'yarn install --frozen-lockfile', 'for': ['javascript', 'typescript'] }
" Plug 'neoclide/coc-highlight', { 'do': 'yarn install --frozen-lockfile' }
" Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile', 'for': 'json' }
" Plug 'neoclide/coc-vetur', { 'do': 'yarn install --frozen-lockfile', 'for': 'vue' }
" Plug 'marlonfan/coc-phpls', { 'do': 'yarn install --frozen-lockfile', 'for': 'php' }
" Plug 'fannheyward/coc-markdownlint', { 'do': 'yarn install --frozen-lockfile', 'for': 'markdown' }
" Plug 'iamcco/coc-flutter', { 'do': 'yarn install --frozen-lockfile', 'for': 'dart' }
" Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile', 'for': 'typescript' }
" Plug 'neoclide/coc-tslint-plugin', { 'do': 'yarn install --frozen-lockfile', 'for': 'typescript' }
" Plug 'fannheyward/coc-pyright', { 'do': 'yarn install --frozen-lockfile', 'for': 'python' }


" waka-waka
" Plug 'wakatime/vim-wakatime'


call plug#end()

filetype plugin indent on

set rnu
set mouse=a
set nowrap
set ruler cursorline
set bg=dark
set ignorecase smartcase
set hlsearch incsearch
set cindent
set sw=2 sts=2 ts=2
set expandtab
set smarttab
set laststatus=2
set backspace=2
set scrolloff=5
set encoding=utf-8
set clipboard=unnamed
set fileformat=unix
set splitbelow splitright
set noshowmode
set wildmenu
set title
set t_Co=256
" always show the tabline
set showtabline=2
" coc
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set guifont=SauceCodePro\ Nerd\ Font\ Mono\ Regular\ 12
syntax enable
syntax on


" setup colorscheme
colorscheme onedark


" key binding
" no arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" no shift needed
nnoremap ; :

" disable recording and map it to quit
" nnoremap <silent>q :q<CR>
" nnoremap <silent>Q :q!<CR>

" coding utils
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap ' ''<ESC>i
" inoremap \" \""<ESC>i
" inoremap {<CR> {<CR>}<ESC>O

" for pane moving
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" execution/compilation utils
" TODO: compile according to filetype
nnoremap <F6> <ESC>:w<CR>:!Rscript %<CR>
nnoremap <F7> <ESC>:w<CR>:!python %<CR>
nnoremap <F8> <ESC>:w<CR>:!python3 %<CR>
nnoremap <F9> <ESC>:w<CR>:!g++ -std=c++17 -O2 -Wall -Wextra -Wshadow %<CR>
nnoremap <F10> :!./a.out<CR>
nnoremap <F11> :!./a.out < in<CR>
nnoremap <F12> :!kotlinc % -include-runtime -d out.jar && echo "Compile finished" && java -jar out.jar<CR>


" filetype alias
au BufRead,BufNewFile *.ino set filetype=cpp
au BufRead,BufNewFile *.sage set filetype=python


" different setting for different language
au Filetype c,cpp setlocal ts=4 sw=4 sts=4 noexpandtab
au Filetype php setlocal ts=4 sw=4 sts=4 expandtab
au Filetype javascript,vue setlocal ts=2 sw=2 sts=2 expandtab
au Filetype vim setlocal ts=4 sw=4 sts=4 expandtab
au Filetype cs setlocal ts=4 sw=4 sts=4 expandtab
au Filetype make setlocal ts=4 sw=4 sts=4 noexpandtab


if has('termguicolors')
    set termguicolors
endif


if has('nvim')
    let s:editor_root=expand('~/.config/nvim')
else
    let s:editor_root=expand('~/.vim')
endif


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


" ---------- Plugins ----------


" joshdick/onedark.vim
let g:onedark_termcolors=256


" luochen1990/rainbow
let g:rainbow_active=1

" https://github.com/ryanoasis/vim-devicons/issues/327
let g:rainbow_conf={
\   'guifgs': ['lightred', 'lightgreen', 'lightcyan', 'lightmagenta'],
\   'ctermfgs': ['lightred', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'separately': {
\       'nerdtree': 0
\   }
\ }


" Yggdroot/indentLine
let g:indentLine_char_list=['|', '¦', '┆', '┊']
set list lcs=tab:\|\ ,trail:·
let g:indentLine_bufNameExclude=['_.*', 'NERD_tree.*']


" dense-analysis/ale
let g:ale_linter_aliases={
\   'vue': ['vue', 'javascript']
\ }
let g:ale_linters={
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier'],
\   'vue': ['eslint', 'vls']
\ }

let g:ale_pattern_options={
\   '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\   '\.min\.css$': {'ale_linters': [], 'ale_fixers': []}
\}
let g:ale_fixers={
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\ }
let g:ale_linters_explicit=1
let g:ale_sign_column_always=1
let g:ale_sign_error='✗'
let g:ale_sign_warning=''
let g:ale_sign_style_error='⚡'
let g:ale_sign_style_warning='⚡'
let g:ale_echo_msg_error_str='✗'
let g:ale_echo_msg_warning_str=''
let g:ale_echo_msg_format='[%linter%] [%severity%] %s'
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_insert_leave=0
let g:ale_lint_on_enter=0
let g:ale_fix_on_save=1
let g:ale_floating_preview=1
let g:ale_hover_to_floating_preview=1
let g:ale_detail_to_floating_preview=1
let g:ale_cursor_detail=1
let g:ale_hover_cursor=1
let g:ale_close_preview_on_insert=1
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)


" scrooloose/nerdtree
noremap <C-n> :NERDTreeToggle<CR>
" Open on startup and focus on the opened file
autocmd VimEnter * NERDTree | wincmd p

" Close on exit
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1


" scrooloose/nerdcommenter
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1

let g:ft = ''
function! NERDCommenter_before()
    if &ft == 'vue'
        let g:ft = 'vue'
        let stack = synstack(line('.'), col('.'))
        if len(stack) > 0
            let syn = synIDattr((stack)[0], 'name')
            if len(syn) > 0
                exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
            endif
        endif
    endif
endfunction

function! NERDCommenter_after()
    if g:ft == 'vue'
        setf vue
        let g:ft = ''
    endif
endfunction


" Xuyuanp/nerdtree-git-plugin
let g:NERDTreeGitStatusUseNerdFonts=1
let g:NERDTreeGitStatusShowIgnored=1
" NOTICE: DO NOT enable this feature if you have also installed vim-devicons.
" let g:NERDTreeGitStatusConcealBrackets=1


" ryanoasis/vim-devicons
let g:webdevicons_conceal_nerdtree_brackets=1

" https://github.com/ryanoasis/vim-devicons/issues/154
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif


" tiagofumo/vim-nerdtree-syntax-highlight


" itchyny/lightline.vim
let g:lightline = {
\   'colorscheme': 'onedark',
\   'separator': {'left': '', 'right': ''},
\   'subseparator': {'left': '', 'right': ''},
\   'active': {
\       'left': [
\           ['mode', 'paste'],
\           ['gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified'],
\       ],
\       'right': [
\           ['percent', 'lineinfo'],
\           ['fileformat', 'fileencoding', 'filetype'],
\           ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'trailing']
\       ]
\   },
\   'tabline': {
\       'left': [
\           ['buffers']
\       ],
\       'right': [
\           ['close']
\       ]
\   },
\   'component_expand': {
\       'buffers': 'lightline#bufferline#buffers',
\       'trailing': 'lightline#trailing_whitespace#component',
\       'linter_checking': 'lightline#ale#checking',
\       'linter_warnings': 'lightline#ale#warnings',
\       'linter_errors': 'lightline#ale#errors',
\       'linter_ok': 'lightline#ale#ok'
\   },
\   'component_type': {
\       'buffers': 'tabsel',
\       'trailing': 'error',
\       'linter_checking': 'right',
\       'linter_warnings': 'warning',
\       'linter_errors': 'error',
\       'linter_ok': 'right'
\   },
\   'component_function': {
\       'readonly': 'LightlineReadonly',
\       'gitbranch': 'gitbranch#name',
\       'cocstatus': 'coc#status',
\       'currentfunction': 'CocCurrentFunction'
\   },
\   'component_raw': {
\       'buffers': 1
\   }
\ }

fu! LightlineReadonly()
  return &readonly ? '' : ''
endfu


" mengelbrecht/lightline-bufferline
let g:lightline#bufferline#filename_modifier=':~:.'
let g:lightline#bufferline#shorten_path=1
let g:lightline#bufferline#show_number=2
let g:lightline#bufferline#number_map={
\   0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
\   5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉'
\ }
let g:lightline#bufferline#unnamed='[No Name]'
let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#unicode_symbols=1
let g:lightline#bufferline#clickable=1

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


" maximbaz/lightline-ale
let g:lightline#ale#indicator_checking=" "
let g:lightline#ale#indicator_warnings=""
let g:lightline#ale#indicator_errors="✗"
let g:lightline#ale#indicator_ok="✓"


" maximbaz/lightline-trailing-whitespace
let g:lightline#trailing_whitespace#indicator = '•'


" alvan/vim-closetag
let g:closetag_html_style='*.html,*.ejs,*.vue,*.blade.php'
let g:closetag_filetypes='html,ejs,vue,blade'


" editorconfig/editorconfig-vim
au FileType gitcommit let b:EditorConfig_disable=1


" octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1
let g:cpp_posix_standard=1
let g:cpp_experimental_template_highlight=1
let g:cpp_concepts_highlight=1
let c_no_curly_error=1


" posva/vim-vue
let g:vue_pre_processors=['pug', 'scss']


" leafOfTree/vim-vue-plugin
let g:vim_vue_plugin_use_pug=1
let g:vim_vue_plugin_use_scss=1
let g:vim_vue_plugin_highlight_vue_attr=1
let g:vim_vue_plugin_highlight_vue_keyword=1


" neoclide/coc.nvim
" <TAB> navigation
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

