set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sheerun/vim-polyglot'

call vundle#end()

filetype plugin indent on
:syntax on
:cnoremap w!! w !sudo tee % >/dev/null
:inoremap jk <ESC>
:set nu
:set linebreak
:set breakindent
:colorscheme meta5
