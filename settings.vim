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

"LSP mappings"
nnoremap <silent>gd <cmd>Lspsaga lsp_finder<CR>
nnoremap <silent>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent>K <cmd>Lspsaga hover_doc<CR>
nnoremap <leader>p <cmd>Lspsaga preview_definition<CR>
nnoremap <silent>S <cmd>Lspsaga signature_help<CR>
nnoremap <leader>e <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <leader>E <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <leader>a <cmd>Lspsaga code_action<CR>
nnoremap <leader>rn <cmd>Lspsaga rename<CR>
nnoremap <leader>m <cmd>Navbuddy<CR>
  
nnoremap <leader>j <C-d>
nnoremap <leader>k <C-u>
nnoremap <leader>l <cmd>e#<CR>

" Buffers
nnoremap <C-s>v <C-w>v
nnoremap <C-s><C-v> <C-w>v
nnoremap <C-s>s <C-w>w
nnoremap <C-s><C-s> <C-w>w
nnoremap <C-s>d <C-w>q
nnoremap <C-s><C-d> <C-w>q

nnoremap <leader>q <cmd>qall<CR>

nnoremap <leader>n <cmd>TestNearest -strategy=neovim<CR>
nnoremap <leader>N <cmd>TestFile -strategy=neovim<CR>

" Insert mappings
imap jj <CR><ESC>O<TAB>
inoremap jk <Esc>
inoremap jl <cmd>lua vim.lsp.buf.completion()<CR>

" Move 1 more lines up or down in normal and visual selection modes.
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'neovim/nvim-lspconfig'
" Extended version of the typescript lsp
Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'kkharji/lspsaga.nvim'

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

Plug 's1n7ax/nvim-window-picker'

Plug 'RRethy/vim-illuminate'

" Themes
Plug 'folke/tokyonight.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'rakr/vim-one'
Plug 'navarasu/onedark.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring' "To make commantary recognize html inside tsx 

Plug 'machakann/vim-highlightedyank'

Plug 'nvim-lualine/lualine.nvim'

Plug 'j-hui/fidget.nvim' " Progress UI for LSP servers 

Plug 'vim-test/vim-test'

Plug 'airblade/vim-gitgutter'

Plug 'kdheepak/lazygit.nvim' " Needs lazygit installed globally
Plug 'sbdchd/neoformat' " Needs prettier installed globally

Plug 'mattn/emmet-vim'

" Motion
Plug 'woosaaahh/sj.nvim'
call plug#end()


let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
lua require("catppuccin").setup()
colorscheme catppuccin

hi linenr guifg=white
hi LspReferenceText guibg=#43464D
hi LspReferenceRead guibg=#43464D
hi LspReferenceWrite guibg=#43464D
hi def IlluminatedWordText guibg=#3B3F52
hi def IlluminatedWordRead guibg=#3B3F52
hi def IlluminatedWordWrite guibg=#3B3F52

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
lua require('sj_config')


let g:user_emmet_leader_key='~'
let g:startify_lists = [
  \  {'type': 'files', 'header': ['   Files']},
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
\ ]

let g:startify_bookmarks = [
    \ {'i': '/Users/jonasnr/.config/nvim' },
    \ {'cb': '/Users/jonasnr/Documents/workplace-center/backend' },
    \ {'cf': '/Users/jonasnr/Documents/workplace-center/frontend' },
    \ {'pf': '/Users/jonasnr/Documents/workplace-portal/frontend/frontend'},
    \ {'pb': '/Users/jonasnr/Documents/workplace-portal/backend/django-backend'}
\ ]

let g:dbs = {
\ 'dev': 'postgres://postgres:postgres@localhost:5432/wpc_db',
\ }

" Autoformat on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
