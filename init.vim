set nocompatible              " be improved, required
filetype plugin indent on    " Required

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
set encoding=utf-8

" screen auto resize
set winwidth=80
set winheight=5
set winminheight=5
set winheight=1000
					
"leader
let mapleader =" "

call plug#begin('~/.config/nvim/plugged')
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'phaazon/hop.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'tpope/vim-surround'
	Plug 'wincent/terminus'
	Plug 'numToStr/Comment.nvim'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'ap/vim-css-color'
	Plug 'machakann/vim-highlightedyank'
	Plug 'yuezk/vim-js'
	Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

" Hop Settings
lua << EOF
  require'hop'.setup()
EOF

nnoremap <silent><leader>f :HopWord<CR>

" telescope settings
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope live_grep<cr>
nnoremap <c-b> <cmd>Telescope buffers<cr>

" telescope settings
lua << END
require'lualine'.setup{
	options = {theme = 'gruvbox_light'}
}
END

" nvim tree settings
lua << END
	require'nvim-tree'.setup()
END

let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
nnoremap <C-n> :NvimTreeToggle<CR>

"comment 
lua << EOF
	require('Comment').setup()
EOF


"indent 
lua << EOF
	require('indent_blankline').setup()
EOF

"Hightlight duration
let g:highlightedyank_highlight_duration = 300

colorscheme gruvbox
