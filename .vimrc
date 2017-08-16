set nocompatible              " be improved, required
filetype plugin indent on    " Required
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
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'mxw/vim-jsx'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'scrooloose/syntastic'
Plugin 'wincent/terminus'
call vundle#end()            " required


" core basic settings
set laststatus=2
"filetype plugin indent on    " required
syntax enable 
highlight Normal ctermfg=grey ctermbg=black
set ruler
set number
set showmatch
set shiftwidth=2
set tabstop=2
set backspace=2


" colored braces
let g:rainbow#pairs = [['(', ')'], ['{', '}'], ['[', ']']]          

" themes for vim & airline status bar
let g:airline_powerline_fonts = 1
set encoding=utf-8
colorscheme base16-tomorrow
let g:airline_theme='cobalt2'

" remapping
"autocmd vimenter * NERDTree
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

" utilsnip 
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"



"ctrl-p related stuff
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|android|node_modules|ios)$'
   

"eslint stuff
let g:syntastic_javascript_checkers = ['eslint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
