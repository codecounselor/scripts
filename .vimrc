colorscheme badwolf
syntax enable

set background=dark
set number

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
"set expandtab       " tabs are spaces

set autoindent
set smartindent

set showcmd             " show command in bottom bar
set cursorline          " highlight current line

set wildmenu            " visual autocomplete for command menu

set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set mouse=a             " Allow mouse to set cursor position

" No annoying sound on errors
set noerrorbells
set novisualbell

"colorscheme solarized
"

" Cursor Colors
highlight Cursor guifg=white guibg=orange
highlight iCursor guifg=white guibg=orange
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

"jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"FIXME
"call plug#begin('~/.vim/plugged')

"Plug 'pangloss/vim-javascript'
"Plug 'nathanaelkane/vim-indent-guides'

"call plug#end()
