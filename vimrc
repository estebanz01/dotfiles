
set nocompatible              " be iMproved, required
filetype off                  " required

" ##############################################################################
"         ####################### VIM BUNDLER ############################

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line


" Colour scheme Base16 plugin
Plugin 'chriskempson/base16-vim'

" Full path fuzz finder
Plugin 'ctrlpvim/ctrlp.vim'

" Surround mapper to delete, change and add operations
" Works with parentheses, brackets, quotes, etc...
Plugin 'tpope/vim-surround'

" Remaps dot command
Plugin 'tpope/vim-repeat'

" Rails plugin for vim.
Plugin 'tpope/vim-rails'

" Show buffers in status and command lines
Plugin 'bling/vim-bufferline'
Plugin 'vim-airline/vim-airline'

" Rubocop Plugin
Plugin 'ngmy/vim-rubocop'

" Make indentations visible
Plugin 'Yggdroot/indentLine'

" Extension for % matcher
Plugin 'matchit.zip'

" Save vim session
Plugin 'tpope/vim-obsession'

" Vim markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Git gutter
Plugin 'airblade/vim-gitgutter'

" Allow to comment selection with one command
Plugin 'tpope/vim-commentary'

call vundle#end()            " required
filetype plugin indent on    " required

" #################################################################################

" ################### Vim main configurations ###################
" Map leader
let mapleader = ","

" allow semicolon to serve as colon
nnoremap ; :

" Syntax
syntax on

" Autoindent
set autoindent
set smartindent

" Modes
set showmode
set showcmd

" Autocompletion with wildmenu
set wildmenu
set wildmode=list:longest,full

" Show curson position
set ruler

" Search configurations
set hlsearch
set incsearch " Move cursor to matched string
set showmatch " It reduces the need for %
set ignorecase " Tries to make searches case insensitive
set smartcase " Tries to make searches case insensitive

" Keep changes when changing between buffers without saving the file
set hidden

" Show the number line
set number

" Keep command history
set history=9999

" Autoreload the file when have been changed outsite Vim
set autoread

" Max number of changes that can be undone
set undolevels=1000

" Set different backup directories
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

" Backspace behaviour
set backspace=indent,eol,start

" Status line
set laststatus=2

set statusline=
set statusline+=%-3.3n\		" Buffer number
set statusline+=%f\ 		" Filename
set statusline+=%h%m%r%w	" Status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]	" File type
set statusline+=%=		" Right align remainder
set statusline+=%-14(%l,%c%V%)	" Line, character
set statusline+=%<%P		" File position

" Execute when a file type matches
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" Execute matchit macros
runtime! macros/matchit.vim

" Idem
set sw=2

" Tab config
set tabstop=2
set shiftwidth=2

" Expand tabs
set expandtab

" Faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Remove trailing whitespace automatically
autocmd BufWritePre *.* :%s/\s\+$//e

" Rubocop && Rubocop config file
let g:vimrubocop_config = '~/vhl/ruby-style-guide/vhl-rubocop.yml'

" ###################################################################################
"           ##################### Prettify Vim #########################

" Colour scheme configurations
set background=dark
colorscheme base16-default-dark

" Change colour font and background for numberline.
highlight LineNr term=bold ctermfg=White ctermbg=NONE

" Change colour when searching/replacing with regex.\
" while searching.
hi IncSearch ctermfg=black ctermbg=grey cterm=bold
" when search is done.
hi Search ctermfg=black ctermbg=grey cterm=bold

" Clear search highlighting
map <C-h> :nohl<CR>

" CTRL + s to save
map <C-s> <esc>:w<CR>

" In insert mode CTRL + s to save and return to insert mode.
imap <C-s> <esc>:w<CR>i

" CTRL + n to next search result
nmap <C-n> :cn<CR>

" CTRL + p to previous search result
nmap <C-p> :cp<CR>

" Switch windows with leader
nmap <Leader>w <C-w><C-w>

" Delete buffer with leader
nmap <Leader>d :bdelete<CR>

" Edit another file in the same directory as the current file
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Inserts the path of the currently edited file into a command
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Leader o inserts blank line above without entering in edit mode.
" leader O does the same below and moves the cursor position to that line.
nmap <silent><leader>o :set paste<CR>m`O<Esc>``:set nopaste<CR>
nmap <silent><leader>O o<Esc>

" If I can set a colour column, set it in the 101 character position.
if exists("&colorcolumn")
  set colorcolumn=101
  highlight ColorColumn ctermbg=Red
endif

" #### Airline plugin configurations
" Display all buffers when there is only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1

" Airline buffer configurations
let g:bufferline_echo = 0
let g:airline_section_c = ''

" Move between buffers with leader.
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" #### Surround plugin configurations

" change double to single quotes
nmap <leader>' cs"'

" change single to double quotes
nmap <leader>" cs'"

" #### Markdown plugin configurations

" Disable automatic markdown folding
let g:vim_markdown_folding_disabled = 1

" Disable markdown conceal
let g:vim_markdown_conceal = 0

" Markdown indent
let g:vim_markdown_new_list_item_indent = 2

" Show markdown in console web browser. This assume that pandoc and lynx are
" installed
map <Leader>x :w<cr>:!pandoc % \| lynx -stdin<cr>:redraw!<cr>

" Hide git gutter if the number of changes i greater than the specified value
let g:gitgutter_max_signs = 500
