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
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'mxw/vim-jsx'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wincent/terminus'
call vundle#end()            " required


" core basic settings
set laststatus=2
filetype plugin indent on    " required
syntax enable 
highlight Normal ctermfg=grey ctermbg=black
set ruler
set number
set showmatch

" colored braces
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" themes for vim & airline status bar
let g:airline_powerline_fonts = 1
set encoding=utf-8
colorscheme base16-ocean
let g:airline_theme='simple'

" remapping
map <F12> :NERDTreeToggle<CR>
:imap jj <Esc>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" screen auto resize
set winwidth=80
set winheight=5
set winminheight=5
set winheight=999

" reactjs stuff
let g:jsx_ext_required = 0

autocmd vimenter * NERDTree

" utilsnip 
let g:UltiSnipsExpandTrigger="<ENTER>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
