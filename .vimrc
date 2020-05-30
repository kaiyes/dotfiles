set nocompatible              " be improved, required
filetype plugin indent on    " Required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()          " required
" All the plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'wincent/terminus'
Plugin 'mitermayer/vim-prettier'
Plugin 'tpope/vim-surround'
Plugin 'machakann/vim-highlightedyank'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'yuezk/vim-js'
Plugin 'jparise/vim-graphql'
Plugin 'Brettm12345/moonlight.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'joshdick/onedark.vim'
Plugin 'AutoComplPop'
Plugin 'tpope/vim-commentary'
call vundle#end()            " required
	
" core basic settings
set laststatus=2
syntax on
set ruler
set number
set showmatch
set shiftwidth=2
set tabstop=2
set backspace=2
" screen auto resize
set winwidth=80
set winheight=5
set winminheight=5
set winheight=999

" remaps 
let mapleader =" "

" colored braces
let g:rainbow#pairs = [['(', ')'], ['{', '}'], ['[', ']']]

" themes for airline status bar
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"####### Themes for vim color ######### 
colorscheme moonlight
let g:airline_theme='cobalt2'

" NerdTree stuff 
map <C-n> :NERDTreeToggle<CR> 
let g:NERDTreeNodeDelimiter = '1'

"Hightlight duration
let g:highlightedyank_highlight_duration = 300

"ctrl-p related stuff
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|android|node_modules|ios)$'
   
" easymotion related
hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=red
map <Leader>f <Plug>(easymotion-bd-w)

"prettier related
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.babel,*.scss,*.less,*.graphql PrettierAsync
let g:prettier#config#print_width = 80
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
