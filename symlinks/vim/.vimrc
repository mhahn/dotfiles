" Setup neobundle
if has('vim_starting')
  set nocompatible
  set runtimepath+=/Users/mhahn/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('/Users/mhahn/.vim/bundle'))
    " Let NeoBundle manage NeoBundle
    NeoBundleFetch 'Shougo/neobundle.vim'

    " neobundles:
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
    NeoBundle 'https://github.com/Shougo/unite.vim.git'
    NeoBundle 'https://github.com/tpope/vim-surround.git'
    NeoBundle 'https://github.com/fatih/vim-go.git'
    NeoBundle 'git@github.com:uarun/vim-protobuf.git'
    NeoBundle 'https://github.com/avakhov/vim-yaml.git'
    NeoBundle 'https://github.com/ekalinin/Dockerfile.vim.git'
    NeoBundle 'https://github.com/othree/yajs.vim.git'
    NeoBundle 'https://github.com/gavocanov/vim-js-indent.git'
    NeoBundle 'https://github.com/othree/es.next.syntax.vim.git'

    " You can specify revision/branch/tag.
    NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
    " async support
    NeoBundle 'Shougo/vimproc', {
          \ 'build' : {
          \     'mac' : 'make -f make_mac.mak',
          \    },
          \ }

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

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
set noswapfile
set nu
let mapleader = ","
syntax on

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

" html support
" ------------
autocmd FileType html setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=120 smartindent
:let g:html_indent_inctags = "html,body,head,tbody"

" python support
" --------------
autocmd FileType python setlocal expandtab shiftwidth=4 colorcolumn=80
\ softtabstop=4
let python_highlight_all=1
let python_highlight_space_errors=0

" taskwarrior support
" --------------------
autocmd BufNewFile,BufRead *.task highlight ExtraWhitespace ctermbg=0

" ruby support
" ------------
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2 smartindent colorcolumn=99

" puppet support
" --------------
autocmd FileType puppet setlocal expandtab shiftwidth=2 softtabstop=2 smartindent colorcolumn=99

" rst
" ---
autocmd BufNewFile,BufRead *.rst setlocal ft=rst
autocmd FileType rst setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=99
\ formatoptions+=nqt textwidth=74

" javascript support
" ---
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=120
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

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

" theme related rules

colorscheme oldfashioned
highlight Comment ctermfg=33
highlight ColorColumn ctermbg=17
highlight LineNr ctermfg=18

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
:set wildignore+=node_modules,bower_components,*.pyc,*.zip,*.swp,dist
" exclude specific eb files
:set wildignore+=python_venv,eventbrite_python,*.fla,*.swf,vagrant/modules,*.png,*.ttf,*.svg,*.jpg,*.gif,*.jpeg
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  'python_venv\|eventbrite_python\|\.fla\|vagrant/modules\|tiny_mce\|python\/img\|python\/static\/images',
  \ }
let g:ctrlp_working_path_mode = 'rc'

" Unite support
let g:unite_force_overwrite_statusline = 0
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_max_candidates = 500000
let g:unite_source_grep_default_opts = '--ignore node_modules --nocolor --noheading'
let g:unite_split_rule = "botright"
call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)
" use ag!
map <Leader>a :Unite grep:. -no-quit<CR>
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-P> :<C-u>Unite  -buffer-name=files   -start-insert buffer file_rec/async:!<cr>

autocmd FileType unite call s:unite_my_settings() "{{{
function! s:unite_my_settings()
  " Overwrite settings.
  let b:SuperTabDisabled=1
  nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction "}}}


" Syntastic support
" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '-'
let g:syntastic_style_warning_symbol = '-'
" Use Flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']
" Ignore Flake8 erros I don't agree with
let g:syntastic_python_flake8_args = '--ignore="E123,E125,E126,E127,E128"'
let g:syntastic_python_flake8_args = "--max-line-length=100"
let g:syntastic_enable_highlighting = 0
let g:syntastic_check_on_open = 1
hi SignColumn ctermbg=232
highlight SyntasticErrorSign ctermfg=Red
highlight SyntasticWarningSign ctermfg=Yellow
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['python', 'ruby'],
                           \ 'passive_filetypes': ['puppet', 'coffee', 'java', 'scss'] }
" avoid go hanging on save
let g:syntastic_go_checkers = []

map <Leader>l :SyntasticToggleMode<CR>
map <Leader>le :Errors<CR>
map <Leader>sc :%s/^.*\/\*/\/\*/<CR>

" Legacy javascript support
map <Leader>ljs :set expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=120<CR>

augroup mine
    au BufWinEnter * sign define mysign
    au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
augroup END

" CtrlP support
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_height = 20
nnoremap <silent> <Leader>t :CtrlP<cr>
nnoremap <silent> <leader>T :ClearCtrlPCache<cr>\|:CtrlP<cr>

cmap w!! %!sudo tee > /dev/null %

" Check neobundle installation
NeoBundleCheck
