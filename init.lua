vim.cmd("set nocompatible")
vim.cmd("filetype plugin indent on")

vim.cmd("set laststatus=2")
vim.cmd("syntax on")
vim.cmd("set ruler")
vim.cmd("set number")
vim.cmd("set showmatch")
vim.cmd("set noswapfile")
vim.cmd("set number relativenumber")
vim.cmd("set splitright")
vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")
vim.cmd("set backspace=2")
vim.cmd("set encoding=utf-8")

vim.cmd("set winwidth=80")
vim.cmd("set winheight=5")
vim.cmd("set winminheight=5")
vim.cmd("set winheight=1000")

vim.cmd("let mapleader =' '")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {'nvim-treesitter/nvim-treesitter', build=':TSUpdate'},
    {'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
    {'kyazdani42/nvim-web-devicons' },
    {'phaazon/hop.nvim' },
  {'nvim-telescope/telescope.nvim'},
  {'jiangmiao/auto-pairs'},
  {'kyazdani42/nvim-tree.lua'},
  {'tpope/vim-surround'},
  {'numToStr/Comment.nvim'},
  {'ap/vim-css-color'},
  {'machakann/vim-highlightedyank'},
  {'mhartington/formatter.nvim'},
  {'nvim-lualine/lualine.nvim'},

  {'rust-lang/rust.vim'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'mrcjkb/rustaceanvim', lazy=false},
  {'folke/trouble.nvim'},
  {'neovim/nvim-lspconfig'},

    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-vsnip'},
    {'hrsh7th/vim-vsnip'},
    {'onsails/lspkind-nvim'},

    {'nvim-lua/plenary.nvim'},
    {'nvim-lua/popup.nvim'},
    {'mfussenegger/nvim-dap'}

}

local opts={}

require("lazy").setup(plugins, opts)

require("catppuccin").setup({})
vim.cmd.colorscheme "catppuccin"

local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {"lua", "javascript", "rust"},
    highlight = {enable=true},
    indent = {enable=true},
})

require'hop'.setup()
local hop = require('hop')
vim.keymap.set('n', '<leader>f', hop.hint_words, {})

 require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            '.gitignore', 'ios', 'node_modules', 'assets', 'android', 'macos'
    }},
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<c-b>', builtin.buffers, {})

require'nvim-tree'.setup()
local api = require "nvim-tree.api"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set('n', '<C-n>', api.tree.toggle,{})

require('Comment').setup()

vim.g.highlightedyank_highlight_duration = 600

require("mason").setup()
require("mason-lspconfig").setup({
     ensure_installed = { "rust_analyzer" },
})

 require("trouble").setup()
 vim.keymap.set("n", "<c-t>", function() require("trouble").toggle() end)


vim.g.rustfmt_autosave = 1


vim.cmd("set completeopt=menu,menuone,noselect")
local cmp = require'cmp'
  local lspkind = require('lspkind')
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
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
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
      { name = "path" },
    },
    formatting = {
      format = lspkind.cmp_format({with_text = true, maxwidth = 50, menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        vsnip = "[vsnip]",
        latex_symbols = "[Latex]",
      }})
    },
  })


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
    typescript = {prettier },
    rust = {prettier},
    typescriptreact= {prettier },
    javascriptreact = { prettier },
    markdown = { prettier },
    json = { prettier },
    vim = { prettier },
    lua= { prettier },
  },
}


vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.tsx,*.ts,*.json FormatWrite
augroup END
]],
  true
)

vim.g.vsnip_snippet_dir = vim.fn.expand('~/.config/nvim/snippets')

-- Map <CR> to clear search highlights
vim.api.nvim_set_keymap('n', '<CR>', ':nohlsearch<CR>', { noremap = true, silent = true })


require('lualine').setup()
