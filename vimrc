call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
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
filetype plugin on

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Remove whitespace
nmap <leader>cw :%s/\s\+$//g<CR>

" Enable mouse everywhere
set mouse=a

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

" Adjust tabwidth for legacy code
nnoremap <Leader>l :set softtabstop=2 shiftwidth=2<CR>

" Adjust tabwidth for not legacy code
nnoremap <Leader>nl :set softtabstop=4 shiftwidth=4<CR>

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

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" Copy/Paste to and from Desktop Environment
noremap <leader>yy "+y
noremap <leader>pp "+gP

" python support
" --------------
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
\ softtabstop=4 smartindent
let python_highlight_all=1
let python_highlight_space_errors=0

au BufNewFile,BufRead *.mako set ft=mako

" rst
" ---
autocmd BufNewFile,BufRead *.rst setlocal ft=rst
autocmd FileType rst setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=79
\ formatoptions+=nqt textwidth=74

" javascript support
" ---
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 colorcolumn=120

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

" use ack!
nnoremap <Leader>a :Ack

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
