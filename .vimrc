set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'chriskempson/base16-vim'

Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr=1
let delimitMate_expand_space=1

Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Fix Airline Fonts
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_symbols.space = ' '

Plugin 'vim-airline/vim-airline-themes'
if !empty($BASE16_SCHEME)
   let g:base16_scheme = $BASE16_SCHEME
endif

if !empty($BASE16_AIRLINE_SCHEME)
   let g:base16_scheme = $BASE16_AIRLINE_SCHEME
endif

if !exists('g:base16_scheme')
   let g:airline_theme = 'base16_'.g:base16_scheme
endif

Plugin 'lepture/vim-jinja'

Plugin 'jeffkreeftmeijer/vim-numbertoggle'
let g:NumberToggleTrigger = '<F2>'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_max_files = 1000
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1

Plugin 'tpope/vim-commentary'

Plugin 'chase/vim-ansible-yaml'

Plugin 'tpope/vim-surround'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_insertion = 1 " Close preview window when you leave insert
set completeopt-=preview                               " Disable preview window


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required 


" Colorscheme
syntax on
set t_Co=256                       " Use 256 color in Vim


" Colorscheme - Base16
" Note(Dan): Check if base16-shell is installed, otherwise the scheme won't
"            look correct.
if filereadable(expand("~/Source/base16-shell/README.md"))
   if !empty($BASE16_SCHEME)
      if filereadable(expand("~/.vim/bundle/base16-vim/colors/base16-".$BASE16_SCHEME.".vim"))
         let base16colorspace=256           " base16 Color Space
         colorscheme base16-$BASE16_SCHEME  " base16 Scheme
      endif
   endif
endif


" Editing - General
set mouse=a                      " Mouse Enable (a = all modes.)
set cursorline                   " Cursor Line Enable
set clipboard=unnamedplus        " Syncronize vim <-> system clipboard.
set wildmenu                     " Autocomplete for Command Menu 
                                 "  Example :e ~/.<tab>
set lazyredraw                   " Allow screen to be redraw lazy
set showmatch                    " Highlight matching brackets [{()}]
set directory^=$HOME/.vim/swap// " All swap files are located in this directory
set visualbell                   " Disable audible bell by enabling the visualbell
set t_vb=                        " Disable visualbell; Note this fully disables the bell


" Editing - Gutter
set number                   " Line Number Enable
set numberwidth=3            " Line Number Size
set relativenumber           " Line Number is relative to cursor location 
set autoread                 " Automatically read file when changed

"autocmd FocusLost * :set number
"autocmd FocusGained * :set relativenumber

"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber


" Editing - Scroll
set scrolloff=3


" Editing - Indenting
set tabstop=2                    " Number of columns that a <TAB> counts for.
set softtabstop=0                " x
set expandtab                    " <Tab> will generate spaces to fill the columns based on <tabstop>.
set autoindent                   " Maintain current indentation on newline.
set smarttab                     " <BS> deletes shiftwidth instead of one space.
set shiftwidth=2                 " Used in conjunction with >> << block shifting.
let g:python_recommended_style=0 " Python ftplugin fixup


" Editing - Indenting Overrides
autocmd FileType *.yaml,*.yml setlocal tabstop=2 shiftwidth=2
autocmd FileType *.j2 setlocal tabstop=2 shiftwidth=2


" Editing - Searching
set incsearch                " Incremental search; move cursor to match as typed.
set ignorecase               " Case sensitivity is disabled.
set smartcase                " Case sensitivity is enabled if Search pattern includes uppercase.
set hlsearch                 " Highlight searches
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


" Editing - Buffers
set hidden                   " Switch buffers without saving; maybe does more.
map <A-h> :bprevious<CR>     " Switch between buffers
map <A-l> :bnext<CR>         " Switch between buffers


" Editing - Movement
"nnoremap j gj                " Move visually, instead of line by line
"nnoremap k gk                " Move visually, instead of line by line
nnoremap B ^                 " Move to the begining of a line
nnoremap E $                 " Move to the ending of a line


" Quirk - YAML Syntax Fix
" Note: Built-in YAML parser is slow for version 7.4
autocmd BufNewFile,BufRead *.yaml,*.yml source ~/.vim/syntax/yaml.vim


" Quirk - ALT Meta-Key Fix
" Note: Rebinds \e<char> to <A-char>
let c='a'
while c <= 'z'
   exec "set <A-".c.">=\e".c
   exec "imap \e".c." <A-".c.">"
   let c = nr2char(1+char2nr(c))
endw

set ttimeout ttimeoutlen=50

