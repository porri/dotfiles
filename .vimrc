" COMMON
set nocompatible        " Make vim more useful
set esckeys             " Allow cursor keys in insert mode
set ttyfast             " Optimize for fast terminal connections
set gdefault            " Add the g flag to search/replace by default
set encoding=utf-8 nobomb  " Use UTF-8 without BOM
let mapleader=","       " Change mapleader
set mouse=a             " Enable mouse in all modes
set noerrorbells        " Disable error bells
set nostartofline       " Don’t reset cursor to start of line when moving around.
set shortmess=atI       " Don't show the intro message when starting vim
set title               " Show the filename in the window titlebar
set scrolloff=3         " Start scrolling three lines before the horizontal window border



" CENTRALIZE BACKUPS, SWAPFILES AND UNDO HISTORY
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" EDITING
set number              " Enable line numbers
syntax on               " Enable syntax highlighting
set cursorline          " Highlight current line
set tabstop=4           " Make tabs as wide as two spaces
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent
set smarttab
set isk+=_,$,@,%,#,-    " none of these should be word dividers, so make them not be


" CONTRAL CHARS
" This line will make Vim set out tab characters, trailing whitespace and
" invisible spaces visually, and additionally use the # sign at the end of
" lines to mark lines that extend off-screen. For more info, see :h listchars.
set list
set listchars=tab:→\ ,eol:¬,trail:·,extends:#,nbsp:_
nmap <silent> <leader>s :set nolist!<CR>    " Make trailing whitespace visible with ,s


" SANE SEARCHING
set smartcase           " case insensitive
set hlsearch            " Hilight search term
set showmatch           " Show matching brackets
set incsearch           " ... dynamically as they are typed
set ignorecase          " Ignore case of searches
nmap <silent> <leader>n :silent :nohlsearch<CR>  " turn of hlsearch temporarily


" FILE SUPPORT
set cf                  " enable error files and error jumping
set ffs=unix,dos,mac    " support all three, in this order
set viminfo+=!          " make sure it can save viminfo
set autoread            " Automatically reread files that have been changed externally
"set noeol               " Don’t add empty newlines at the end of files
"set binary


" MAPPINGS
nnoremap ; :        " Make ';' an alias for ':'
"nnoremap j gj       " Make j and k behave more natural when working with long, wrapped lines
"nnoremap k gk
nnoremap <tab> %    " Make the tab key match bracket pairs
vnoremap <tab> %
imap <silent> <S-tab> <C-v><tab>    " Shift-tab to insert a hard tab
noremap p p`[       " don't move the cursor after pasting
noremap P P`[       " (by jumping to back start of previously changed text)



" STRIP TRAILING WHITESPACE (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>


" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif


" status / command line
set statusline=
set statusline+=%f\ %2*%m\ %1*%h
set statusline+=%#warningmsg#
" set statusline+=%{fugitive#statusline()}  see: https://github.com/cypher/dotfiles/blob/master/vimrc
set statusline+=%*
set statusline+=%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}]\ %12.(%c:%l/%L%)
set laststatus=2        " Always show status line
set ruler               " Show the cursor position
set showmode            " Show the current mode
set showcmd             " Show the (partial) command as it’s being typed
set wildmenu            " Enhance command-line completion


