set nocompatible
filetype plugin indent on
syntax on
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'Zemnmez/chimera-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'gcmt/taboo.vim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

set mouse=a
set termguicolors
colorscheme chimera

let g:ctrlp_root_markers = ['METADATA']

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = '/usr/bin/ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ --ignore review
    \ -g ""'
endif
