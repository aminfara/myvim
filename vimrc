"===============================================================================
" Key Mappings Summary
"===============================================================================

" First letter n, i, v, a are modes (a for all)

" Mode | Key | Function
" ---- | --- | --------
" n | <C-L> | clears search highlight (by sensible)
" i | <C-U> | undo in insert mode (by sensible)
" n, v | <Leader>s | easymotion search
" n | <Leader>fb | FZF Buffers
" n | <Leader>fc | FZF Commands
" n | <Leader>ff | FZF Files
" n | <Leader>fh | FZF File history
" n | <Leader>fl | FZF Lines
" n | <Leader>fm | FZF Maps
" n | <Leader>fs | FZF Ag
" n | <Leader>ft | FZF Tags
" n | <Leader>fw | FZF Ag word under cursor
" n | <leader>n | NERDTreeToggle (this is lazy loaded)
" n | <leader>gd | Fugitive Gdiff
" n | <leader>ge | Fugitive Gedit
" n | <leader>gl | Fugitive Git log
" n | <leader>gs | Fugitive Gstatus
" n | <leader>gh | Fugitive Gsplit
" n | <leader>gv | Fugitive Gvsplit

" Plus all default mappings for loaded modules. Here are some examples:

" Mode | Key | Function
" ---- | --- | --------
" n, v | <Leader><Leader>w | easymotion word motion
" n, v | <Leader><Leader>j | easymotion line down motion
" n, v | <Leader><Leader>k | easymotion line up motion
" n, v | <Leader><Leader>b | easymotion word backward motion
" n | cs | change surrounding
" n | ds | delete surrounding
" n | ys | insert surrounding
" n | gc{motion} | Commentary toggle comment on a move
" n | gcc | Commentary toggle line comment


"===============================================================================
" Plugins
"===============================================================================

" Installing vim-plug see https://github.com/junegunn/vim-plug/wiki/faq
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
call plug#end()


"===============================================================================
" Vim General Config
"===============================================================================

" Sensible
"----------------------------------------

" It is necessary to load sensible here if we want to override some behavior.
" See FAQ on https://github.com/tpope/vim-sensible
"
runtime! plugin/sensible.vim


" Behavioral
"----------------------------------------

" 'filetype plugin indent on' is set in sensible

""
" Encodings
"
if has("multi_byte")
  scriptencoding utf-8
  set encoding=utf-8
  set fileencoding=utf-8
  " set bomb is commented out because we use utf-8
  " for other multi-byte ucs please remove comment
  "set bomb

  " Order of file encoding for existing files, ucs needs to precedes utf-8
  set fileencodings=ucs-bom,utf-8,latin1
  if &termencoding == ""
    " Handling keyboard inputs same as 'encoding'
    let &termencoding = &encoding
  endif
endif

set fileformats=unix,dos,mac  " EOL format


""
" Files and directories (vim related)
"
silent !mkdir -vp ~/.vim/tmp/undo/
silent !mkdir -vp ~/.vim/tmp/swap/
silent !mkdir -vp ~/.vim/tmp/backup/
silent !mkdir -vp ~/.vim/tmp/spell/
set backupdir=~/.vim/tmp/backup,.
set directory=~/.vim/tmp/swap,.
set undodir=~/.vim/tmp/undo,.
set nobackup
set noswapfile
set undofile
set undolevels=2000
set spellfile=~/.vim/tmp/spell/en.utf-8.add
set viminfo+=n~/.vim/tmp/viminfo
" autoread is set by sensible
set autowriteall


""
" Indentation
"
" autoindent is set by sensible
set expandtab
set shiftwidth=4
set tabstop=4


""
" Mouse
"
if has("mouse")
  set mouse=a
  " Hide mouse pointer on insert mode."
  set mousehide
  set mousemodel=popup
endif


""
" Search
"
" incsearch is set be sensible
set hlsearch
set ignorecase
set smartcase


""
" Spell checking
"
set spell
set spelllang=en_us


""
" Miscellaneous
"
set clipboard^=unnamed,unnamedplus    " copy to system clipboard
set hidden                            " enable multiple modified buffer
set lazyredraw                        " don't redraw in the middle of a plugin run
set omnifunc=syntaxcomplete#Complete  " turn on builtin auto-completion
set switchbuf=useopen,usetab,newtab   " switching buffers behavior
set ttyfast                           " modern terminals are fast


" Visual
"----------------------------------------

""
" Folding
"
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
set foldenable


""
" Invisible characters
"
set listchars=tab:⇥\ ,trail:·
set list  " Show invisible characters


""
" Scroll offsets
"
set scrolloff=5
set sidescrolloff=10


""
" Splitting windows
"
set splitbelow
set splitright


""
" Terminal color settings
"
" Setting color to 16 for xterm
if &term == "xterm" || &term == 'screen'
  set t_Co=16
  " clearing using the current background color
  set t_ut=
  colorscheme default
endif

if $COLORTERM == 'gnome-terminal'
  set term='xterm-256color'
endif

" Setting color to 256 for more sophisticated terminals
if &term =~ '256color'
  set t_Co=256
  " clearing using the current background color
  set t_ut=
endif


""
" Wild menu
"
" wildmenu is set by sensible
set wildmode=longest,full
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif


""
" Wrapping
"
set colorcolumn=120
set textwidth=0
set wrapmargin=0
if v:version >= 704 && has('patch346')
  " wrap words with indent (view)
  set wrap
  set linebreak
  set breakindent
else
  set nowrap
endif


""
" Miscellaneous
"
set completeopt=menuone,preview       " completion pop-up
set cursorline                        " draws a line to show the current line
set noshowmode                        " don't show mode, status bar plugin will show it
set number                            " show line numbers
set showcmd                           " show partial command
set visualbell                        " beep visually

"===============================================================================
" Plugins Configurations
"===============================================================================

" Solarized color scheme
"----------------------------------------
if &term =~ '256color'
  silent! colorscheme solarized
  set background=dark
endif


" Easymotion
"----------------------------------------
let g:EasyMotion_smartcase = 1


" Airline
"----------------------------------------
let g:airline_powerline_fonts = 0
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '▸'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '◂'
let g:airline_left_sep          = ''
let g:airline_left_alt_sep      = '>'
let g:airline_right_sep         = ''
let g:airline_right_alt_sep     = '<'
let g:airline_symbols.readonly  = '⊘'
let g:airline_symbols.linenr    = '␊'
let g:airline_symbols.branch    = '⎇' "⮑, ➔, ➥, ⤴
" let g:airline_symbols.paste     = 'ρ' "Þ, ∥
let g:airline_symbols.whitespace = 'Ξ'


" NERDTree
"----------------------------------------
let NERDTreeShowHidden=1


"===============================================================================
" Key Bindings
"===============================================================================

let g:mapleader = "\<Space>"
let g:maplocalleader = "\\"

" Easymotion
"----------------------------------------
nmap <Leader>s <Plug>(easymotion-s2)
vmap <Leader>s <Plug>(easymotion-s2)

" FZF
"----------------------------------------
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fc :Commands<CR>
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>fl :Lines<CR>
nnoremap <silent> <Leader>fm :Maps<CR>
nnoremap <silent> <Leader>fs :Ag<CR>
nnoremap <silent> <Leader>ft :Tags<CR>
nnoremap <silent> <Leader>fw :Ag <C-R><C-W><CR>


" NerdTree
"----------------------------------------
map <silent> <leader>n :NERDTreeToggle<CR>


" Fugitive
"----------------------------------------
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gl :Git log --stat --graph --decorate --all<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gh :Gsplit<CR>
nnoremap <silent> <leader>gv :Gvsplit<CR>


" vim:set filetype=vim expandtab shiftwidth=2:
