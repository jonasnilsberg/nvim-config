set tabstop=2 softtabstop=2
set clipboard+=unnamed
set shiftwidth=2
set expandtab
set smartindent
set relativenumber
set nohlsearch
set noerrorbells
set nu
set nowrap
set incsearch
set signcolumn=yes
set hidden
set scrolloff=8
set signcolumn=yes
set mouse=a
set updatetime=200

syntax on

let mapleader = " "
nnoremap x "_x
nnoremap X "_x
nnoremap c "_c
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>s <cmd>Telescope live_grep<cr>
nnoremap <leader>t <cmd>Neotree position=float dir=./ toggle reveal<cr>
nnoremap <leader>w <cmd>:w<CR>
nnoremap <silent> <leader>gg :LazyGit<CR>

"harpoon
nnoremap <leader>F <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>ha <cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hn <cmd>lua require("harpoon.ui").nav_next()<CR>
nnoremap <leader>hN <cmd>lua require("harpoon.ui").nav_prev()<CR>

"undotree
nnoremap <leader>u <cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>

"LSP mappings"
nnoremap <silent>gd <cmd>Lspsaga lsp_finder<CR>
nnoremap <silent>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>S <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent>K <cmd>Lspsaga hover_doc<CR>
nnoremap <leader>e <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <leader>E <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <leader>a <cmd>Lspsaga code_action<CR>
nnoremap <leader>rn <cmd>Lspsaga rename<CR>
  
nnoremap <leader>j <C-d>
nnoremap <leader>k <C-u>

nnoremap <leader>n <cmd>TestNearest -strategy=neovim<CR>
nnoremap <leader>N <cmd>TestFile -strategy=neovim<CR>

" Insert mappings
imap jj <CR><ESC>O<TAB>

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-ts-autotag'

Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'wellle/targets.vim'

Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'

Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'akinsho/toggleterm.nvim'

Plug 'ThePrimeagen/harpoon'

Plug 'mbbill/undotree'

" Themes
Plug 'folke/tokyonight.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'rakr/vim-one'
Plug 'navarasu/onedark.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring' "To make commantary recognize html inside tsx 

Plug 'machakann/vim-highlightedyank'

Plug 'nvim-lualine/lualine.nvim'

Plug 'j-hui/fidget.nvim' " Progress UI for LSP servers 

Plug 'vim-test/vim-test'

" DB support
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'airblade/vim-gitgutter'

Plug 'kdheepak/lazygit.nvim' " Needs lazygit installed globally
Plug 'sbdchd/neoformat' " Needs prettier installed globally

Plug 'mattn/emmet-vim'

call plug#end()



let g:catppuccin_flavour = "frappe" " latte, frappe, macchiato, mocha
lua require("catppuccin").setup()
colorscheme catppuccin

hi linenr guifg=white
hi LspReferenceText guibg=#43464D
hi LspReferenceRead guibg=#43464D
hi LspReferenceWrite guibg=#43464D

lua require('nvim_cmp')
lua require('nvim_treesitter')
lua require('toggle_term')
lua require('telescope_fzf')
lua require('lsp_config')
lua require('lua_line')
lua require('lua_fidget')
lua require('neo_tree')
lua require('lspsaga-config')
lua require('snippy_config')

let g:user_emmet_leader_key=','
let g:startify_lists = [
  \  {'type': 'files', 'header': ['   Files']},
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
\ ]

let g:startify_bookmarks = [
    \ {'i': '/Users/jonasnr/.config/nvim' },
    \ {'cb': '/Users/jonasnr/Documents/workplace-center/wpc-backend' },
    \ {'cf': '/Users/jonasnr/Documents/workplace-center/frontend' },
    \ {'pf': '/Users/jonasnr/Documents/workplace-portal/frontend/frontend'},
    \ {'pb': '/Users/jonasnr/documents/workplace-portal/backend/django-backend'}
\ ]

let g:dbs = {
\ 'dev': 'postgres://postgres:postgres@localhost:5432/wpc_db',
\ }

" Autoformat on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
