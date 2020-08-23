set nocompatible
set hidden                      " Hide buffers rather than close them
set confirm
set encoding=utf-8
set showcmd                     " display incomplete commands
set number                      " show line numbers
set wrap linebreak nolist       " wrap lines
set cursorline                  " highlight current row
set cursorcolumn                " highlight current column
"set tags=tags
set path=.
"set textwidth=110
" autocmd BufEnter *.md setlocal formatoptions+=t " hard line wrapping
autocmd BufEnter *.adoc setlocal formatoptions+=t " hard line wrapping
autocmd BufEnter *.adoc syntax off
"syntax on " Disabled for performance reasons

"" Undo
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

set wildignore=*.swp,*.bak,*.pyc,*.class " Ignore

set title         " change the terminal's title
set visualbell    " don't beep
set noerrorbells  " seriously, don't beep

" Don't use backup files
set nobackup
set noswapfile

"" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
" set list                      " visually displace spaces
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" set listchars=trail:.,extends:#,nbsp:.
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
"set list
" autocmd BufWritePre * %s/\s\+$//e " Automatically trim trailing whitespace

"" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Folding
"set fdm=indent

"" Autoread
set autoread
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w


"" Searching
set hlsearch      " highlight matches
set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ... unless they contain at least one capital letter

"set paste         " paste cleanly

"" colorscheme
"let iterm_profile = $ITERM_PROFILE
"if iterm_profile == "dark"
"	colorscheme slate
"else
"	colorscheme tomorrow
"endif

"" Enable pathogen for sexy runtimepath management
execute pathogen#infect()
filetype plugin indent on       " load file type plugins + indentation

" set runtimepath+=/usr/local/Cellar/go/1.3/libexec/misc/vim

" if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   " syntax on
" endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * silent! normal! g`"zv
"\ if line("'\"") > 0 && line("'\"") <= line("$") |
"\   exe "normal! g`\"" |
"\ endif

" python handling
if has("autocmd")

  " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
  " earlier, as it is important)
  " Borrowed from @nvie
  autocmd filetype python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd filetype python setlocal textwidth=78
  autocmd filetype python match ErrorMsg '\%>120v.\+'

  " But disable autowrapping as it is super annoying
  "autocmd filetype python setlocal formatoptions-=t

  " Python runners
  autocmd filetype python noremap <buffer> <F5> :w<CR>:!python %<CR>
  autocmd filetype python inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
  autocmd filetype python noremap <buffer> <S-F5> :w<CR>:!ipython %<CR>
  autocmd filetype python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython %<CR>

  " Automatic insertion of breakpoints
  autocmd filetype python nnoremap <buffer> <leader>bp :normal Oimport pdb; pdb.set_trace()<Esc>

  " Toggling True/False
  autocmd filetype python nnoremap <silent> <C-t> mmviw:s/True\\|False/\={'True':'False','False':'True'}[submatch(0)]/<CR>`m:nohlsearch<CR>

  " Run a quick static syntax check every time we save a Python file
  " autocmd BufWritePost *.py call Flake8()
endif

" vim-go
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_fmt_experimental = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_test_timeout = '45m'

" Leader commands
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" vim-terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" vim-netrw
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 1

" fzf
set rtp+=/usr/local/opt/fzf

" NERDTree
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p  " Go to previous (last accessed) window.
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeNodeDelimiter = "\u00a0"

" Deoplete
"let g:deoplete#enable_at_startup = 1

" Omnicomplete
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
