"#==============================================================#
"# Plugins                                                      #
"#==============================================================#
call plug#begin('~/.vim/plugged')
"#==============================================================#
"# User experience (UI, code completion, search etc.)           #
"#==============================================================#
Plug 'lifepillar/vim-solarized8'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'godlygeek/tabular'
"#==============================================================#
"# Language-related (syntax highlighting etc.)                  #
"#==============================================================#
Plug 'lilydjwg/colorizer'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
call plug#end()

"#==============================================================#
"# General settings (aka "hacks")                               #
"#==============================================================#

"#==============================================================#
"# Color settings                                               #
"#==============================================================#
set termguicolors                      " Enable TrueColor
set background=dark                    " Dark background for editor
colorscheme solarized8_high            " Color scheme name
hi LineNr guibg=NONE ctermbg=NONE      " Transparent line number column for solarized8_high theme

"#==============================================================#
"# UI settings                                                  #
"#==============================================================#
syntax enable       " Enable syntax highlighting
set noshowmode      " To hide messages like -- INSERT --
set number          " Show line numbers
set wildmenu        " Visual autocomplete for the commands

"#==============================================================#
"# UX settings                                                  #
"#==============================================================#
set expandtab              " Convert TABs to spaces
set tabstop=4              " Number of spaces in TAB
set softtabstop=4          " Number of spaces in TAB when editing text
set shiftwidth=4           " Number of spaces for each step of (auto)indent
set foldlevelstart=10      " Starting fold level (not lines, more like 'nesting' level)
set foldnestmax=10         " Max number of nested folds
set foldmethod=syntax      " Folding based on indentation level
set incsearch              " Search as chars are entered
set hlsearch               " Highlight matches

"#==============================================================#
"# Autocmds                                                     #
"#==============================================================#
" 🠗 Disable insertion of comments when creating a new line with "o" or Enter 
autocmd BufNewFile,BufRead * setlocal formatoptions-=o formatoptions-=r

"#==============================================================#
"# FileType settings                                            #
"#==============================================================#
filetype plugin indent on                                  " Load filetype-specific indent files
autocmd FileType json syntax match Comment +\/\/.\+$+      " Disable red comments in JSON (JSONC, anyone?)

"#==============================================================#
"# Airline settings                                             #
"#==============================================================#
let g:airline_powerline_fonts = 1           " Enable fancy font characters
" 🠗 Define object for Airline symbols if it doesn't exist
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.notexists = ' '      " Symbol for untracked files

"#==============================================================#
"# ALE settings                                                 #
"#==============================================================#
let g:ale_echo_msg_error_str = 'E'                            " Prefix for 'Error' severity level
let g:ale_echo_msg_warning_str = 'W'                          " Prefix for 'Warning' severity level
let g:ale_echo_msg_info_str = 'I'                             " Prefix for 'Info' severity level
let g:ale_sign_error = ''                                    " Error messages symbol
let g:ale_sign_warning = ''                                  " Warning messages symbol
let g:ale_sign_info = ''                                     " Info messages symbol
hi ALEErrorSign guifg=#C30500 guibg=NONE                      " Highlight for error messages
hi ALEWarningSign guifg=#ffa30f guibg=NONE                    " Highlight for warning messages
hi ALEInfoSign guifg=#f5e400 guibg=NONE                       " Highlight for info messages
" 🠗 List of formatting fixing tools 
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['prettier', 'eslint'],
    \   'typescript': ['prettier', 'eslint'],
    \}  
" 🠗 Mapping for fixing command 
nnoremap <leader>f :ALEFix<CR>  

"#==============================================================#
"# Coc.nvim settings                                            #
"#==============================================================#
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tsserver'
    \]
" 🠗 Navigate forward with Tab in pop-up 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" 🠗 Navigate backward with Shift-Tab in pop-up 
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" 🠗 Choose first pop-up item with Enter 
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" 🠗 Initiate code action for the message on the current line
nmap <leader>ca <Plug>(coc-codeaction)

"#==============================================================#
"# NERDTree settings                                            #
"#==============================================================#
" 🠗 Toggle the tree pane with Alt-1
map <M-1> :NERDTreeToggle<CR>  
" 🠗 Close vim if NERDTree is the only window left
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

