" Setup neobundle
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" neobundles
NeoBundle 'git@github.com:tpope/vim-fugitive.git'
NeoBundle 'git@github.com:mhahn/vim-airline.git'
NeoBundle 'https://github.com/Lokaltog/vim-easymotion.git'
NeoBundle 'https://github.com/godlygeek/tabular.git'
NeoBundle 'https://github.com/scrooloose/syntastic.git'
NeoBundle 'https://github.com/scrooloose/nerdcommenter.git'
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
NeoBundle 'https://github.com/rking/ag.vim.git'
NeoBundle 'https://github.com/mileszs/ack.vim.git'
NeoBundle 'https://github.com/kien/ctrlp.vim.git'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \    },
      \ }

" Personal configs
set visualbell           " don't beep
set noerrorbells         " don't beep
set hlsearch      " highlight search terms
set encoding=utf8
set expandtab
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start
set incsearch
set ignorecase
set ruler
set wildmenu
set commentstring=\ #\ %s
set clipboard+=unnamed
set scrolloff=10
let mapleader = ","
syntax on
filetype plugin indent on

"split settings
set splitbelow
set splitright

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Remove whitespace
nmap <leader>cw :%s/\s\+$//g<CR>

" Hide mouse pointer while typing
set mousehide
set mousemodel=popup

" Enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring="%:t"\ -\ Vim

" <leader>v selects the just pasted text
nnoremap <leader>v V`]

" switch case of line to Title Case
nnoremap <Leader>r :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<CR>

" clear matches
nnoremap <leader>rm :call clearmatches()<CR>

" unhighlight search
nnoremap <leader>uh :nohlsearch<CR>

" highlight search
nnoremap <leader>h :set hlsearch<CR>

" shortcut for hiding buffer
nnoremap <leader>i :hide<CR>

" shortcut for fugitive Gstatus
nnoremap <leader>gs :Gstatus<CR>
" shorcut for fugitive Gblame
nnoremap <leader>gb :Gblame -w<CR>

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" Copy/Paste to and from Desktop Environment
noremap <leader>yy "+y
noremap <leader>pp "+gP

" python support
" --------------
autocmd FileType python setlocal expandtab shiftwidth=4 colorcolumn=79
\ softtabstop=4 nosmartindent
let python_highlight_all=1
let python_highlight_space_errors=0

" taskwarrior support
" --------------------
autocmd BufNewFile,BufRead *.task highlight ExtraWhitespace ctermbg=0

" ruby support
" ------------
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2 smartindent colorcolumn=79

au BufNewFile,BufRead *.mako set ft=mako

" puppet support
" --------------
autocmd FileType puppet setlocal expandtab shiftwidth=2 softtabstop=2 smartindent colorcolumn=79

" rst
" ---
autocmd BufNewFile,BufRead *.rst setlocal ft=rst
autocmd FileType rst setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=79
\ formatoptions+=nqt textwidth=74

" javascript support
" ---
autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=120

" json support
autocmd BufNewFile,BufRead *.json setlocal ft=json
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=120

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


" template language support (SGML / XML too)
" ------------------------------------------
" and disable taht stupid html rendering (like making stuff bold etc)

fun! SelectHTML()
  let n = 1
  while n < 50 && n < line("$")
    " check for jinja
    if getline(n) =~ '{%\s*\(extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
      set ft=htmljinja
      return
    endif
    " check for mako
    if getline(n) =~ '\(<%\(def\|inherit\)\|% if\)'
      set ft=mako
      return
    endif
    " check for genshi
    if getline(n) =~ 'xmlns:py\|py:\(match\|for\|if\|def\|strip\|xmlns\)'
      set ft=genshi
      return
    endif
    let n = n + 1
  endwhile
  " go with html
  set ft=html
endfun

autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
autocmd BufNewFile,BufRead *.html,*.htm  call SelectHTML()
let html_no_rendering=1
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" theme related rules

colorscheme oldfashioned
highlight Comment ctermfg=33
highlight ColorColumn ctermbg=17

" whitespace matching
highlight ExtraWhitespace ctermbg=1
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" highlight the current line & column - use \c to turn on
hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" instead of splitting the same file, split with a blank window
function! Open_New_File()
  vert topleft new
endfunction
map <C-O> :call Open_New_File()<CR>

" copy current filename to clipboard
nnoremap <Leader>f :let @+=expand("%")<CR>

" use ag!
nnoremap <Leader>a :Ag

" NERDtree on <leader>nt
nnoremap <Leader>nt :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" make all windows almost equal size
map <Leader>e <C-W>=<CR>

" move through split window actions
nnoremap <C-J> <C-W>w
nnoremap <C-K> <C-W>W

" open the current buffer in a new tab
map <Leader>o :tabedit %<CR>

"" easy escape with jj
inoremap jj <ESC>

" vim-airline support
set laststatus=2
let g:airline_theme='simple'
let g:airline_fugitive_prefix = '⎇ '

" toggle autoindenting
:nnoremap <F8> :setl inde=<CR>

" exclude certain files from listings
:set wildignore+=node_modules,bower_components,*.pyc,*.zip,*.swp
" exclude specific eb files
:set wildignore+=python_venv,eventbrite_python,*.fla,*.swf,vagrant/modules,*.png,*.ttf,*.svg,*.jpg,*.gif,*.jpeg
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  'python_venv\|eventbrite_python\|\.fla\|vagrant/modules\|tiny_mce\|python\/img\|python\/static\/images',
  \ }


" Syntastic support
" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
" Use Flake8
let g:syntastic_python_checkers = ['flake8']
" Ignore Flake8 erros I don't agree with
let g:syntastic_python_flake8_args = '--ignore="E123,E125,E126,E127,E128"'
let g:syntastic_enable_highlighting = 0
hi SignColumn ctermbg=232
highlight SyntasticErrorSign ctermfg=Red
highlight SyntasticWarningSign ctermfg=Yellow
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

map <Leader>l :SyntasticToggleMode<CR>
map <Leader>le :Errors<CR>

" CtrlP support
let g:ctrlp_clear_cache_on_exit = 0
nnoremap <silent> <Leader>t :CtrlP<cr>
nnoremap <silent> <leader>T :ClearCtrlPCache<cr>\|:CtrlP<cr>

" Check neobundle installation
NeoBundleCheck
