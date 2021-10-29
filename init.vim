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
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'tpope/vim-surround'
	Plug 'wincent/terminus'
	Plug 'numToStr/Comment.nvim'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'ap/vim-css-color'
	Plug 'machakann/vim-highlightedyank'
	Plug 'yuezk/vim-js'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'onsails/lspkind-nvim'
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

"color
"colorscheme gruvbox
colorscheme hybrid

"snippet/autocomplete menu
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'
	local lspkind = require('lspkind')

  cmp.setup({
    snippet = {
      expand = function(args)
				vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Enter>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
			{ name = "path" },
			},
		
		formatting = {
			format = lspkind.cmp_format({with_text = true, maxwidth = 50, menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      vsnip= "[vsnip]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Latex]",
    })})
		}
  })
EOF

"let g:vsnip_filetypes.javascriptreact = ['javascript']
"let g:vsnip_snippet_dir += get(g:, 'vsnip_snippet_dirs', []) + [expand('<sfile>:p:h:h').'/snippets']

lua << EOF
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').html.setup{
    capabilities = capabilities
		}
EOF

imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
