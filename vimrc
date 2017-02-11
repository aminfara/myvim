" Please look at https://github.com/aminfara/myvim for more information about
" installing and key bindings.


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
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'chriskempson/base16-vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neoinclude.vim'
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
let g:netrw_home='~/.vim/tmp'
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

if !empty(glob('~/.vim/plugged/base16-vim')) && filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
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

" Easymotion
"----------------------------------------
let g:EasyMotion_smartcase = 1


" Airline
"----------------------------------------
let g:airline_powerline_fonts = 0
let g:airline_theme = 'base16'
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


" Syntastic
"----------------------------------------
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_warning_symbol = '!!'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '!'
let g:syntastic_loc_list_height = 5
let g:syntastic_always_populate_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1


" neocomplete
"----------------------------------------
" Disable AutoComplPop
let g:acp_enableAtStartup = 0
" Use neocomplete
let g:neocomplete#enable_at_startup = 1
" Use smartcase
let g:neocomplete#enable_smart_case = 1
" Set minimum keyword length
let g:neocomplete#min_keyword_length = 3
" Select the first choice automatically
let g:neocomplete#enable_auto_select = 1

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
 let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
 let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
 let g:neocomplete#force_omni_input_patterns = {}
endif


" UltiSnips
"----------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsJumpForwardTrigger="<nop>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"===============================================================================
" Language settings
"===============================================================================

" Ruby
"----------------------------------------

if executable('ruby')
  ""
  " OmniCompletion
  "
  augroup myvim_ruby
    autocmd!
    autocmd FileType ruby,eruby setlocal tabstop=2|set shiftwidth=2
    autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  augroup END

  ""
  " Syntastic
  "
  let g:syntastic_ruby_checkers = ['mri']
  if executable('rubocop')
    let g:syntastic_ruby_checkers = g:syntastic_ruby_checkers + ['rubocop']
    let g:syntastic_ruby_rubocop_args = '--display-cop-names'
  endif

  ""
  " neocomplete
  "
  let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::\w*'

endif


" Python
"----------------------------------------

if executable('python')
  ""
  " OmniCompletion
  "
  augroup myvim_python
    autocmd!
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  augroup END

  ""
  " Syntastic
  "
  let g:syntastic_python_checkers = ['python']
  if executable('flake8')
    let g:syntastic_python_checkers = g:syntastic_python_checkers + ['flake8']
  endif
endif


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

" Help related
"----------------------------------------
cabbrev h tab help
cabbrev help tab help

augroup myvim_help
  autocmd!
  autocmd FileType help noremap <buffer> q :q<cr>
augroup END


" Autocomplete and Snippets
"----------------------------------------
function! ExpandSnippetOrKey(key)
  let g:ulti_expand_or_jump_res = 0
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return a:key
  endif
endfunction

inoremap <expr> <CR> pumvisible() ? "<C-y><C-R>=ExpandSnippetOrKey(\"\")<CR>" : "\<CR>"
inoremap <expr> <TAB>  pumvisible() ? "\<C-n>" : "<C-R>=ExpandSnippetOrKey(\"\t\")<CR>"


" vim:set filetype=vim expandtab shiftwidth=2:
