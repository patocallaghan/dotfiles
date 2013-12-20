cd c:\dev
set encoding=utf-8
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'L9'

" My bundles here:
"
" original repos on GitHub
Bundle 'othree/vim-autocomplpop'
Bundle 'kien/ctrlp.vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdtree'
Bundle 'myusuf3/numbers.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'Shutnik/jshint2.vim'

" Turn on line numbering
set number

" Gui
:set guioptions-=T

" Syntax highlighting

" Detect filetype
filetype plugin on
" Enable syntax highighting
syntax enable
" 256 colours, please
set t_Co=256
" Dark solarized scheme
let g:solarized_italic=0
let g:solarized_bold=0
set background=dark
colorscheme solarized

" Font Scheme
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


" Turn on OmniCompletion
set omnifunc=syntaxcomplete#Complete

" Set relevant filetypes
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.md set filetype=markdown

" Open Vim Maximised on Start
au GUIEnter * simalt ~x


" Tabs, indentation and lines

filetype plugin indent on
" 4 spaces please
set noexpandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
" Round indent to nearst multiple of 4
set shiftround
" No line-wrapping
set wrap
" highlight tabs and trailing spaces
set list
set listchars=tab:>\ ,eol:¬,trail:-
highlight NonText guifg=#094D5E
highlight SpecialKey guifg=#094D5E

" Interactions

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=3
set sidescrolloff=5
" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1
"Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]

" Visual decorations

" Show status line
set laststatus=2
" Show what mode youre currently in
set showmode
" Show what commands youre typing
set showcmd
" Allow modelines
set modeline
" Show current line and column position in file
set ruler
" Show file title in terminal tab
set title
" Limit line-length to 80 columns by highlighting col 81 onward
if exists("+colorcolumn")
    set colorcolumn=81
endif
"Highlight current line
set cursorline
" Don't keep results highlighted after searching...
set nohlsearch
" ...just highlight as we type
set incsearch
" Ignore case when searching...
set ignorecase
" ...except if we input a capital letter
set smartcase

" Create undo file
set undofile
set dir=%TMP%
set backupdir=%TMP%
set undodir=%TMP%

" Mappings
:let mapleader = ","

" Plugins

" AutoComplPop
let g:acp_behaviorRubyOmniMethodLength = -1

" NERDTree
autocmd vimenter * NERDTree
map <Leader>nt :NERDTreeToggle<CR>
nnoremap <F9> :NERDTreeToggle c:\dev

" Numbers
nnoremap <F3> :NumbersToggle<CR>

" JSHint
let jshint2_save = 1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" CtrlP ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.?(dist|sass-cache|git|hg|svn|node_modules|Library|umbraco|UserControls|ScheduledTasks|Properties|masterpage|App_Browsers|App_Code|DocumentTypes|install|macroScripts|media|umbraco_client)$',
  \ 'file': '\v\.(exe|so|dll|master|cs|ascx|sln|csproj|pdb)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Turn off arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Fixing typo keys
" Maps pressing F1 to <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Reselect just pasted text
nnoremap <leader>v V`]

" Open up .vimrc file quickly
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"Quicker Escaping
inoremap jk <ESC>

" Split Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
