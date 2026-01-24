set nocompatible
filetype plugin on
syntax on

set number
set mouse=a
set title
set scrolloff=5
set showcmd
set wildmenu
set laststatus=2
set showmode
set ruler
set linebreak
set display+=lastline

set ignorecase
set smartcase
set incsearch
set hlsearch

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

set encoding=utf-8
set fileencoding=utf-8
set nobackup
set nowritebackup
set noswapfile
set autoread
set backspace=indent,eol,start

set splitright
set splitbelow

set ttyfast
set lazyredraw

set background=light
colorscheme morning

hi StatusLine ctermbg=DarkBlue ctermfg=White cterm=bold
hi StatusLineNC ctermbg=DarkGrey ctermfg=White
hi WildMenu ctermbg=Yellow ctermfg=Black

set statusline=
set statusline+=%#StatusLine#
set statusline+=\ %f
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=[%{&fileencoding}]
set statusline+=\ [%{&fileformat}]
set statusline+=\ %y
set statusline+=\ %l:%c
set statusline+=\ %L
set statusline+=\ %P

highlight Normal ctermfg=Black ctermbg=White
highlight Comment ctermfg=DarkGrey
highlight LineNr ctermfg=DarkGrey
highlight Search ctermbg=Yellow ctermfg=Black
highlight IncSearch ctermbg=DarkYellow ctermfg=Black
highlight Visual ctermbg=LightCyan ctermfg=Black
highlight Constant ctermfg=DarkRed
highlight Identifier ctermfg=DarkBlue
highlight Statement ctermfg=DarkBlue
highlight PreProc ctermfg=DarkMagenta
highlight Type ctermfg=DarkGreen
highlight Special ctermfg=DarkRed

nnoremap <silent> <leader><space> :nohlsearch<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript,html,css setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab

if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif
endif
