set tabstop=2 softtabstop=2
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
set updatetime=750

let mapleader = " "
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>s <cmd>Telescope live_grep<cr>
nnoremap <leader>t <cmd>Neotree position=float dir=./ toggle reveal<cr>
nnoremap <leader>w <cmd>:w<CR>
nnoremap <silent> <leader>gg :LazyGit<CR>

"LSP mappings"
nnoremap <silent>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>e <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>E <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
  
nnoremap <leader>d <C-d>
nnoremap <leader>u <C-u>
nnoremap <leader>c <cmd>:bd<CR>
map <leader>j <Plug>(easymotion-overwin-f2)

nnoremap <leader>n <cmd>TestNearest -strategy=neovim<CR>
nnoremap <leader>N <cmd>TestFile -strategy=neovim<CR>

"Copy/Paste to system clipboard"
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Buffers
nnoremap <leader>b <cmd>:bnext<CR>
nnoremap <leader>B <cmd>:bprevious<CR>
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <leader>c <Cmd>bd<CR> 
imap jj <CR><ESC>O<TAB>

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }


Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'akinsho/toggleterm.nvim'

" Themes
Plug 'folke/tokyonight.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'rakr/vim-one'

Plug 'akinsho/bufferline.nvim'

Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring' "To make commantary recognize html inside tsx 

Plug 'machakann/vim-highlightedyank'
Plug 'easymotion/vim-easymotion'

Plug 'nvim-lualine/lualine.nvim'

Plug 'j-hui/fidget.nvim' " Progress UI for LSP servers 

Plug 'vim-test/vim-test'

" DB support
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'airblade/vim-gitgutter'

Plug 'kdheepak/lazygit.nvim' " Needs lazygit installed globally
Plug 'sbdchd/neoformat' " Needs prettier installed globally

call plug#end()

syntax on
colorscheme one
" hi LineNr guibg=none guifg=#ffffff

lua require'nvim-treesitter.configs'.setup {}
lua require('nvim_cmp')
lua require('nvim_treesitter')
lua require('toggle_term')
lua require('buffer_line')
lua require('telescope_fzf')
lua require('lsp_config')
lua require('lua_line')
lua require('lua_fidget')

"LSP servers
lua require('lspconfig').tsserver.setup{}
lua require('lspconfig').pyright.setup{}
lua require('lspconfig').yamlls.setup{}
lua require('lspconfig').tailwindcss.setup{}
lua require('lspconfig').html.setup{}
lua require('emmet')

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

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
