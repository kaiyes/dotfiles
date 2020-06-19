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
"Plugin 'pangloss/vim-javascript'
Plugin 'jparise/vim-graphql'
Plugin 'Brettm12345/moonlight.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'joshdick/onedark.vim'
Plugin 'AutoComplPop'
Plugin 'tpope/vim-commentary'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ap/vim-css-color'
Plugin 'arzg/vim-rust-syntax-ext'
Plugin 'rust-lang/rust.vim'
Plugin 'keith/swift.vim'
call vundle#end()            " required

	
" core basic settings
set laststatus=2
syntax on
set ruler
set number
set showmatch
set noswapfile
set number relativenumber
set splitright
set shiftwidth=2
set tabstop=2
set backspace=2
" screen auto resize
set winwidth=80
set winheight=5
set winminheight=5
set winheight=1000
 

"remaps 
let mapleader =" "

" colored braces
let g:rainbow#pairs = [['(', ')'], ['{', '}'], ['[', ']']]

" themes for airline status bar
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"####### Themes for vim color ######### 
colorscheme moonlight
autocmd FileType rust colorscheme xcodedark 
autocmd FileType swift colorscheme xcodedark 
highlight Pmenu ctermbg=gray guibg=gray
let g:airline_theme='cobalt2'

" NerdTree stuff 
map <C-n> :NERDTreeToggle<CR> 
let g:NERDTreeNodeDelimiter = '1'

"Hightlight duration
let g:highlightedyank_highlight_duration = 300

"ctrl-p related stuff
"let g:ctrlp_by_filename = 1
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|android|node_modules|ios)$'
   
" easymotion related
hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=red
map <Leader>f <Plug>(easymotion-bd-w)
let g:EasyMotion_keys = 'asdfghjklqwertyuiopzxcvbnm'

"prettier related
let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_config_files = [".prettierrc.js"]
autocmd BufWritePre *.js,*.json,*.css,*.babel,*.scss,*.less,*.graphql PrettierAsync
let g:prettier#config#print_width = 80
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'false'

