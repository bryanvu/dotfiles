let mapleader = "," " Configuration file for vim
"nnoremap ,, , 
"xnoremap ,, , 
"onoremap ,, ,

" Neovim terminal stuff
:tnoremap <Esc> <C-\><C-n>

set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

syntax on
filetype plugin indent on

set background=dark
colorscheme molokai

set nobackup
set nowritebackup
set noswapfile
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set wildmode=longest,list
set history=200
filetype indent on
filetype on
filetype plugin on

set t_Co=256
set t_ut=

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
noremap <F5> :buffers<CR>:buffer<Space>

" Powerline
set rtp+=/usr/share/vim/vim73/bundle/powerline/bindings/vim

set laststatus=2

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'garyharan/vim-proto'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'chaoren/vim-wordmotion'
Plug 'benmills/vimux'
Plug 'benmills/vimux-golang'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Initialize plugin system
call plug#end()

filetype plugin indent on     " required!

" Go! Stuffs
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" Auto Compile
autocmd FileType go compiler go
syntax on

"Window movement
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

imap jk <Esc>
imap <C-O> <C-x><C-o>

" Stuff for syntastic
" :help syntastic-checker-options for help with options
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=1
let g:syntastic_go_checkers = ['go']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=10

let g:go_fmt_experimental = 1

let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 1

" Deoplete config
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set relativenumber
set number

" Write built files automatically
set autowrite

map <C-n> :NERDTreeToggle<CR>

autocmd BufNewFile,BufReadPost *.h,*.cxx,*.cpp,*.cc set filetype=cpp

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_metalinter_autosave = 1
let g:go_list_type = "quickfix"
let g:go_snippet_engine = "ultisnips"

set updatetime=1000

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax sync minlines=256
set synmaxcol=300
set re=1
