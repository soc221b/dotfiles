" " Clone Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" " Install Plugins
" vim +PluginInstall +qall

" vundle begin
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'wojciechkepka/vim-github-dark'

call vundle#end()            " required
filetype plugin indent on    " required
" vundle end

syntax enable
set number
set noic
set laststatus=2
set background=dark
set t_Co=256
colorscheme ghdark
