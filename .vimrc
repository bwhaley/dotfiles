set nocompatible
set hidden                      " Hide buffers rather than close them
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set number                      " show line numbers
filetype plugin indent on       " load file type plugins + indentation

"" Undo
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

set wildignore=*.swp,*.bak,*.pyc,*.class " Ignore

set title         " change the terminal's title
set visualbell    " don't beep
set noerrorbells  " don't beep

" Don't use backup files
set nobackup
set noswapfile

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set list                        " visually displace spaces
set listchars=tab:>.,trail:.,extends:#,nbsp:.

"" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


"" Searching
set hlsearch      " highlight matches
set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ... unless they contain at least one capital letter

set paste         " paste cleanly

"" Use mustang color scheme
"" if &t_Co >= 256 || has("gui_running")
""   colorscheme mustang
"" endif

"" GoLang syntax
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on


if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

"" Enable pathogen for sexy runtimepath management
execute pathogen#infect()

" Filetype specific handling {{{
" only do this part when compiled with support for autocommands
if has("autocmd")

  " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
  " earlier, as it is important)
  " Borrowed from @nvie
  autocmd filetype python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd filetype python setlocal textwidth=78
  autocmd filetype python match ErrorMsg '\%>120v.\+'

  " But disable autowrapping as it is super annoying
  autocmd filetype python setlocal formatoptions-=t

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
