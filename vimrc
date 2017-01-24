"===============================================================================
" Key mappings
"===============================================================================

" First letter n, i, v, a are modes (a for all)

" n | <C-L> | clears search highlight (by sensible)
" i | <C-U> | undo in insert mode (by sensible)


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
call plug#end()


"===============================================================================
" Vim general config
"===============================================================================

" It is necessary to load sensible here if we want to override some behavior.
" See FAQ on https://github.com/tpope/vim-sensible
"
runtime! plugin/sensible.vim

" Setting up vim related files and directories
"
silent !mkdir -vp ~/.vim/tmp/undo/
silent !mkdir -vp ~/.vim/tmp/swap/
silent !mkdir -vp ~/.vim/tmp/backup/
silent !mkdir -vp ~/.vim/tmp/spell/
set undodir=~/.vim/tmp/undo,.
set directory=~/.vim/tmp/swap,.
set backupdir=~/.vim/tmp/backup,.
set spellfile=~/.vim/tmp/spell/en.utf-8.add
set viminfo+=n~/.vim/tmp/viminfo

" vim:set filetype=vim expandtab shiftwidth=2:
