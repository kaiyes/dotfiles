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
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'wincent/terminus'
Plugin 'mitermayer/vim-prettier'
Plugin 'tpope/vim-surround'
call vundle#end()            " required

" core basic settings
set laststatus=2
syntax enable 
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

" NerdTree stuff 
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR> 
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
"inoremap <Tab> <c-r>=UltiSnips#ExpandSnippet()<cr>
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"



"ctrl-p related stuff
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|android|node_modules|ios)$'
   

" easymotion related
hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=red

"prettier related
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.babel,*.scss,*.less,*.graphql PrettierAsync
let g:prettier#config#print_width = 80
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
