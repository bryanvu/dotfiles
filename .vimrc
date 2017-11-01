let mapleader = "," " Configuration file for vim
nnoremap ,, , 
xnoremap ,, , 
onoremap ,, ,

set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

execute pathogen#infect()
syntax on
filetype plugin indent on

"colorscheme tomorrow-night-eighties
set background=dark
colorscheme jellybeans

set nobackup
set nowritebackup
set noswapfile
set lines=40
set columns=80
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

" Auto complete tab stuff
"function! Smart_TabComplete()
"  let line = getline('.')                         " current line
"
"  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
"                                                  " line to one character right
"                                                  " of the cursor
"  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
"  if (strlen(substr)==0)                          " nothing to match on empty string
"    return "\<tab>"
"  endif
"  let has_period = match(substr, '\.') != -1      " position of period, if any
"  let has_slash = match(substr, '\/') != -1       " position of slash, if any
"  if (!has_period && !has_slash)
"    return "\<C-X>\<C-P>"                         " existing text matching
"  elseif ( has_slash )
"    return "\<C-X>\<C-F>"                         " file matching
"  else
"    return "\<C-X>\<C-O>"                         " plugin matching
"  endif
"endfunction
"
"noremap <tab> <c-r>=Smart_TabComplete()<CR>

" numbers stuff
"noremap <F3> :NumbersToggle<CR>

set laststatus=2

" Vundle Stuffs
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

Plugin 'scrooloose/syntastic'
Plugin 'fatih/vim-go'
"Plugin 'fatih/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'garyharan/vim-proto'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'SirVer/ultisnips'
"Plugin 'ervandew/supertab'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'skywind3000/asyncrun.vim'
"Plugin 'rjayatilleka/vim-insert-char'
Plugin 'chaoren/vim-wordmotion'
Plugin 'benmills/vimux'
Plugin 'benmills/vimux-golang'

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
"let g:syntastic_auto_jump=1
let g:syntastic_go_checkers = ['go']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

let g:go_fmt_experimental = 1

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

set relativenumber
set number

" Write built files automatically
set autowrite

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

map <C-n> :NERDTreeToggle<CR>

autocmd BufNewFile,BufReadPost *.h,*.cxx,*.cpp,*.cc set filetype=cpp

" go-vim tutorial suggestions
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>rt <Plug>(go-run-tab)
autocmd FileType go nmap <leader>rs <Plug>(go-run-split)
autocmd FileType go nmap <leader>rv <Plug>(go-run-vertical)
autocmd FileType go nmap <leader>ds <Plug>(go-def-split)
autocmd FileType go nmap <leader>dv <Plug>(go-def-vertical)
autocmd FileType go nmap <leader>dt <Plug>(go-def-tab)

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_metalinter_autosave = 1
" let g:go_auto_type_info = 1
let g:go_list_type = "quickfix"
let g:neocomplete#enable_at_startup = 1

set updatetime=100
" setlocal omnifunc=go#complete#Complete

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" set foldmethod=syntax

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax sync minlines=256
set synmaxcol=300
set re=1
