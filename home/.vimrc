set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rust-lang/rust.vim'
Plugin 'b4b4r07/vim-hcl'
Plugin 'fatih/vim-go'

call vundle#end()

filetype plugin indent on
:syntax on
:set nu
:set linebreak
:set breakindent
:colorscheme meta5
