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
	"Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'onsails/lspkind-nvim'
	Plug 'mhartington/formatter.nvim'
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
local vim = vim
  local cmp = require'cmp'
	local lspkind = require('lspkind')

  cmp.setup({
    snippet = {
      expand = function(args)
				vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },

	mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, 
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
		 ['<Tab>'] = cmp.mapping(function(fallback)
	   if vim.fn['vsnip#available']() == 1 then
		    feedkey("<Plug>(vsnip-expand)","<C-n>")
		 else
       if vim.fn.pumvisible() == 1 then
		    feedkey("<C-N>","n")
			else
				 feedkey("<Tab>","n")
			 end
	   end
    end, {'i', 's'});	
				},
			
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
			{ name = "path" }
			},
		
		formatting = {
			format = lspkind.cmp_format({with_text = true, maxwidth = 50, menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      vsnip= "[vsnip]",
      latex_symbols = "[Latex]",
			})})
		},
  })
EOF

lua << EOF
local vim = vim
local format = require("formatter")

local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
    stdin = true,
  }
end

format.setup {
  logging = false,
  filetype = {
    javascript = { prettier },
    javascriptreact = { prettier },
    markdown = { prettier },
    json = { prettier },
		vim = { prettier },
		},
}


vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.json FormatWrite
augroup END
]],
  true
)
EOF

"Jump forward or backward in snippets
 imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
 smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
 imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
 smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'


 
