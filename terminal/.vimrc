call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'habamax/vim-asciidoctor'
call plug#end()

set ttimeoutlen=10  "key code delay (ms); for eliminating delay when switching between modes
set lazyredraw      "redraw the screen only when needed
set noshowmode      "to get rid of thing like --INSERT--
set shortmess+=F    "to get rid of the file name displayed in the command line bar

syntax enable       "enable syntax processing
filetype indent on  "load filetype-specific indent files
set tabstop=4       "number of visual spaces per TAB
set softtabstop=4   "number of spaces in TAB when editing
set expandtab       "converts TABs to spaces
set number          "show line numbers
set wildmenu        "visual autocomplete for the commands
set showmatch       "highlight matching [({})]
set foldenable      "enable folding (e.g. functions' bodies)
set foldlevelstart=10   "starting fold level (not lines, more like 'nesting' level)
set foldnestmax=10      "max number of nested folds
set foldmethod=syntax   "fold based on indentation level

set incsearch       "search as chars are entered
set hlsearch        "highlight matches

