call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'lifepillar/vim-solarized8'

Plug 'habamax/vim-asciidoctor'

Plug 'lilydjwg/colorizer'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
call plug#end()

set ttimeoutlen=10  "key code delay (ms); for eliminating delay when switching between modes
set lazyredraw      "redraw the screen only when needed
set noshowmode      "to get rid of thing like --INSERT--
set shortmess+=c    "to get rid of the file name displayed in the command line bar

syntax enable       "enable syntax processing
filetype plugin indent on  "load filetype-specific indent files
set tabstop=4       "number of visual spaces per TAB
set softtabstop=4   "number of spaces in TAB when editing
set shiftwidth=4
set expandtab       "converts TABs to spaces
set number          "show line numbers
set signcolumn=yes
set wildmenu        "visual autocomplete for the commands
set showmatch       "highlight matching [({})]
set foldenable      "enable folding (e.g. functions' bodies)
set foldlevelstart=10   "starting fold level (not lines, more like 'nesting' level)
set foldnestmax=10      "max number of nested folds
set foldmethod=syntax   "fold based on indentation level

set incsearch       "search as chars are entered
set hlsearch        "highlight matches

"Color settings
set termguicolors
set background=dark
colorscheme solarized8_high
hi LineNr ctermbg=NONE guibg=NONE
"hi Normal guibg=#125161
let g:solarized_extra_hi_groups=1

"NERDTree settings
map <Esc>1 :NERDTreeToggle<CR>

"
let g:ale_lint_on_insert_leave=1
"let g:ale_linters_explicit = 1
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['prettier', 'eslint'],
    \   'typescript': ['prettier', 'eslint'],
    \}
nnoremap <leader>f :ALEFix<CR>
"let g:ale_fix_on_save=1
"let g:ale_open_list=1
"let g:ale_list_window_size=5
"augroup CloseLoclistWindowGroup
"    autocmd!
"    autocmd QuitPre * if empty(&buftype) | lclose | endif
"augroup END

"coc.nvim
"inoremap <silent><expr> <c-space> coc#refresh()
set hidden
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
"    if (index(['vim','help'], &filetype) >= 0)
"        execute 'h '.expand('<cword>')
"    else
"        call CocAction('doHover')
"    endif
"endfunction

"let g:deoplete#enable_at_startup = 1

autocmd FileType json syntax match Comment +\/\/.\+$+
