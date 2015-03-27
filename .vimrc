cd ~/dev
set encoding=utf-8
set nocompatible

syntax on
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'L9'

" ==============================================
" Vundle plugins
" ==============================================
" File Explorers
Bundle 'scrooloose/nerdtree'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'duff/vim-bufonly'

" Syntax & spacing Plugins
Bundle 'scrooloose/syntastic'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'elzr/vim-json'
Bundle 'slim-template/vim-slim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'nathanaelkane/vim-indent-guides'

" Movement plugins
Bundle 'myusuf3/numbers.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'christoomey/vim-tmux-navigator'

" Status plugins
Bundle 'bling/vim-airline'
Bundle 'mhinz/vim-signify'

" Writing plugins
Bundle 'mattn/emmet-vim'
Bundle 'SirVer/ultisnips'
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
" Bundle 'othree/vim-autocomplpop'


Bundle 'tpope/vim-fugitive'
Bundle 'roman/golden-ratio'
Bundle 'majutsushi/tagbar'
Bundle 'rizzatti/dash.vim'

filetype plugin indent on
syntax on

" Turn on line numbering
set number

" Toggle Paste mode
set pastetoggle=<F2>

" Gui
:set guioptions-=T

" 256 colours, please
set t_Co=256
" Dark solarized scheme
let g:solarized_italic=0
let g:solarized_bold=0
set background=dark
colorscheme solarized

" Change cursor between normal and insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

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

" 2 spaces please
set shiftwidth=2
set tabstop=2
set expandtab
set smartindent
" Round indent to nearst multiple of 2
set shiftround
" No line-wrapping
set wrap
" highlight tabs and trailing spaces
set list
set listchars=tab:>\ ,eol:¬,trail:-
highlight NonText guifg=#094D5E
highlight SpecialKey guifg=#094D5E

" Interactions

" Turn off mouse
set mouse =""
" Start scrolling slightly before the cursor reaches an edge
set scrolloff=3
set sidescrolloff=5
" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1
"Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]

"Show matching bracets when text indicator is over them
set showmatch

" Visual decorations

" Show status line
set laststatus=2
" Show what mode youre currently in
set showmode
" Show what commands youre typing
set showcmd
" All modelines
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
" set directory=~/.vim/tmp
set dir=~/.vim/tmp
" set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp
set nobackup
set nowritebackup
set noswapfile

" Mappings
:let mapleader = ","

" Plugins

" Exuberant ctags
set tags=./tags;~/dev

" TagBar
nmap <F8> :TagbarToggle<CR>

" AutoComplPop
" let g:acp_behaviorRubyOmniMethodLength = -1

" NERDTree
autocmd vimenter * NERDTree
nnoremap <F9> :NERDTreeToggle ~/dev/

" Numbers
nnoremap <F3> :NumbersToggle<CR>

" JSHint
let jshint2_save = 1

" Coffeesript
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab foldmethod=indent nofoldenable

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" CtrlP
let g:ctrlp_map = '<Leader>p'
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

" ==============================================
" Key mappings
" ==============================================
" Fixing typo keys
" Maps pressing F1 to <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"Open a list of buffers and change to the number selected
 nnoremap <leader>t :buffers<CR>:buffer<Space>

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

"Open Ag
nmap <Leader>f :Ag 

" CtrlP
" open CtrlP buffer explorer
nnoremap <leader>b :CtrlPBuffer<CR>
" open CtrlP as a fuzzy finder
nnoremap <leader>p :CtrlP<CR>

" NerdTree
map <leader>d :NERDTreeToggle<cr>
nmap <leader>nt :NERDTreeFind<CR>

" Run current file in ruby
imap <Leader>rr <ESC>:!ruby %<CR>
nmap <Leader>rr :!ruby %<CR>

" go to the last file you had open
nmap <leader>l <c-^>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

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
