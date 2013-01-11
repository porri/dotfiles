" Make vim more useful
set nocompatible
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=4


" This line will make Vim set out tab characters, trailing whitespace and
" invisible spaces visually, and additionally use the # sign at the end of
" lines to mark lines that extend off-screen. For more info, see :h listchars.
set list
set listchars=tab:→\ ,eol:¬,trail:·,extends:#,nbsp:_
" Make trailing whitespace visible with ,s
nmap <silent> <leader>s :set nolist!<CR>




" Sane searching
set hlsearch            " Hilight search term
set showmatch           " Show matching brackets
set incsearch           " ... dynamically as they are typed
set ignorecase          " Ignore case of searches
" turn of hlsearch temporarily
nmap <silent> <leader>n :silent :nohlsearch<CR>


" allow backspacing over everything in insert mode
set backspace=indent,eol,start


" status line
set statusline=
set statusline+=%f\ %2*%m\ %1*%h
set statusline+=%#warningmsg#
" set statusline+=%{fugitive#statusline()}  see: https://github.com/cypher/dotfiles/blob/master/vimrc
set statusline+=%*
set statusline+=%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}]\ %12.(%c:%l/%L%)
" Always show status line
set laststatus=2


set cf                  " enable error files and error jumping
set ffs=unix,dos,mac    " support all three, in this order
set viminfo+=!          " make sure it can save viminfo
set isk+=_,$,@,%,#,-    " none of these should be word dividers, so make them not be



set mouse=a     " Enable mouse in all modes

set noerrorbells  " Disable error bells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

set scrolloff=3         " Start scrolling three lines before the horizontal window border
set autoread            " Automatically reread files that have been changed externally

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif



" Make ';' an alias for ':'
nnoremap ; :
" Clear search buffer
nnoremap <leader><leader> :nohlsearch<CR>

" Make j and k behave more natural when working with long, wrapped lines
nnoremap j gj
nnoremap k gk

" Make the tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>

" don't move the cursor after pasting
" (by jumping to back start of previously changed text)
noremap p p`[
noremap P P`[


