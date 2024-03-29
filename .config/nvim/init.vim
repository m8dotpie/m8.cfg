" Website: m8dotpie.co.uk

filetype plugin indent on " Enable filetype dependent features

" Basic configuration
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h15
set colorcolumn=90        " Char limit marker at 90th column
set textwidth=90          " Line breaks at char limit
set hidden                " Allow buffer switching without saving
set autoread              " Autoupdate changed files
set ignorecase            " Case insensitive searching
set smartcase             " Case-sensitive but smart
set shell=/bin/zsh\ -i    " Terminal environment is zsh now
set incsearch             " Incremental search
set mouse=a               " Mouse enabled
set magic                 " Enable regex magic

" Appearance configuration
syntax on                 " Enable syntax highlighting
set number relativenumber " Enable smart relative line numbers
set wrap                  " Wrap long lines on screen
set linebreak             " Wrap long lines only by whole words
set showtabline=2         " Always enable tabline
set hlsearch              " Search highlighting
set noerrorbells          " No error bells
set visualbell            " Make bell behave as screen flash
set autoindent            " Autoindent new lines
set scrolloff=5           " Number of lines above and below the cursor
set laststatus=2          " Status line enabled for multiple windows
set showmatch             " Show matching braces
set matchtime=2           " 2/10 seconds to blink matching brace
set updatetime=200        " This time of inactivity updates swap file (ms)
set shortmess+=c          " Hide prompts from ins-completion-menu
set encoding=utf8

" Tabs configuration
set smarttab              " Respect 'tabstop' and others on tabbing
set tabstop=8             " Visible width of tabs
set softtabstop=4         " Inserted tabs length
set expandtab             " Spaces instead of tabs
set shiftwidth=4          " Indentation width
set shiftround            " Round indent to multiple of 'shiftwidth'

if (has('termguicolors'))
  set termguicolors
endif

" Plugins initialization and configuration
lua << EOF
require'plugins'
require'plugins-cfg'
EOF

" DDC Engine configuration
call ddc#custom#patch_global('sources', ['nvimlsp'])
call ddc#custom#patch_global('sourceOptions', {
            \ 'around': {'mark': 'A'},
            \ 'nvimlsp': {'mark': 'lsp'},
            \ '_': {
            \   'matchers': ['matcher_head'],
            \   'sorters': ['sorter_rank']},
            \ })
call ddc#enable()
call ddc_nvim_lsp_doc#enable()

" Coloscheme setting
colorscheme material

" Custom hotkeys configuration
" Spacemacs like Esc shortcuts
inoremap fd <Esc>
inoremap ав <Esc>
" Disabling arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
" Telescope hotkeys
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" NerdTree hotkeys
nnoremap <C-n> <cmd>NERDTree<CR>
