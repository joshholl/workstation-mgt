let g:python_host_prog='/usr/bin/python2'

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" Look and feel
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"javascript 
Plug 'flowtype/vim-flow', { 'for': 'javascript' }

"general dev thangs
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

for file in split(globpath('~/.config/nvim/config/', '*.vim'), '\n')
	execute 'source' fnameescape(file)
endfor


