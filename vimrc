"===============================================================================
" PLugins
"===============================================================================

" Installing vim-plug see https://github.com/junegunn/vim-plug/wiki/faq
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
call plug#end()
