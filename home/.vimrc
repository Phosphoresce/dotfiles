set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'valloric/youcompleteme'
Plugin 'vim-test/vim-test'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'junkblocker/patchreview-vim'

call vundle#end()

filetype plugin indent on
:syntax on
:cnoremap w!! w !sudo tee % >/dev/null
:inoremap jk <ESC>
:set nu
:set linebreak
:set breakindent
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
:colorscheme meta5
map <C-n> :NERDTreeToggle<CR>
set pastetoggle=<F2>
set autowrite

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
