set nocompatible              " be improved, required
filetype off    " Required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()          " required

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'pangloss/vim-javascript'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
call vundle#end()            " required


" core basic settings
set laststatus=2
filetype plugin indent on    " required
syntax enable 
highlight Normal ctermfg=grey ctermbg=black
set ruler
set number
set showmatch

"  coloured braces
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" themes for vim & airline status-bar
colorscheme base16-ocean
let g:airline_theme='base16'
set encoding=utf-8
let g:airline_powerline_fonts = 1

" NERDTree remapping
map <F2> :NERDTreeToggle<CR>


" handleBar 
let g:mustache_abbreviations = 1
