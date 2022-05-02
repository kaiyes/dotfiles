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
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'jiangmiao/auto-pairs'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'tpope/vim-surround'
    Plug 'numToStr/Comment.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'ap/vim-css-color'
    Plug 'machakann/vim-highlightedyank'
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'mhartington/formatter.nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'TovarishFin/vim-solidity'

    " completion libraries
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'onsails/lspkind-nvim'

    " libraries used by other libs
    Plug 'nvim-lua/plenary.nvim'
    Plug 'simrat39/rust-tools.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'mfussenegger/nvim-dap'
call plug#end()

" LSP setup automatic

lua << EOF
  require("nvim-lsp-installer").setup {}
EOF

" Hop Settings
lua << EOF
  require'hop'.setup()
EOF

nnoremap <silent><leader>f :HopWord<CR>
"nnoremap <silent><leader>f :HopChar1<CR>

" telescope settings
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope live_grep<cr>
nnoremap <c-b> <cmd>Telescope buffers<cr>

lua << EOF
require('telescope').setup{
    defaults = { file_ignore_patterns = { "node_modules", '.gitignore', 'ios' }}
}
EOF

lua << END
    require'nvim-tree'.setup()
END



let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
nnoremap <C-n> :NvimTreeToggle<CR>

lua << EOF
    require('Comment').setup()
EOF


lua << EOF
    require('indent_blankline').setup()
EOF

"Hightlight duration
let g:highlightedyank_highlight_duration = 300

"colorscheme gruvbox
"colorscheme hybrid
"colorscheme tender
colorscheme nightfox
"hi Normal ctermbg=16 guibg=#000000
"hi LineNr ctermbg=16 guibg=#000000

"snippet/autocomplete menu
set completeopt=menu,menuone,noselect

lua <<EOF
-- Setup nvim-cmp.
local vim = vim
  local cmp = require'cmp'
    local lspkind = require('lspkind')
    local feedkey = function(key, mode)
     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

  cmp.setup({
    snippet = {
      expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end
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
            -- tab expanson
            ["<Tab>"] = cmp.mapping(function(fallback)
       if cmp.visible() then
        --cmp.select_next_item()
              cmp.confirm({ select= true })
       elseif vim.fn["vsnip#available"](1) == 1 then
         feedkey("<Plug>(vsnip-expand-or-jump)", "")
             else
         fallback()
       end
         end, { "i", "s" }),
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

let g:vsnip_snippet_dir = expand('~/.config/nvim/snippets')

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

lua << EOF
local nvim_lsp = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

require('rust-tools').setup({})
EOF

lua << EOF
require'lspconfig'.solc.setup{}
EOF


" themes for airline status bar
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>
