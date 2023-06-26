-- Set up lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
  -- Dependencies
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',

  -- Treesitter
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-context',

  -- Lsp
  'neovim/nvim-lspconfig',
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
  },
  'williamboman/mason-lspconfig.nvim',
  'jose-elias-alvarez/typescript.nvim',
  'folke/trouble.nvim',
  'folke/lsp-colors.nvim',
  'jose-elias-alvarez/null-ls.nvim',

  -- UI
  'stevearc/dressing.nvim', -- Replace input etc.

  -- Completion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',

  -- Snippets
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',

  -- Telescope
  'nvim-telescope/telescope.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },

  -- Neotree (File explorer)
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim'
    }
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
  },

  --Terminal
  'akinsho/toggleterm.nvim',

  -- Tabs
  'nanozuki/tabby.nvim',

  -- Git
  'kdheepak/lazygit.nvim',
  'lewis6991/gitsigns.nvim',

  -- Commenting
  'tpope/vim-commentary',
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- Autopairing of brackets etc.
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  -- Navigation
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({mode = 'exact'})
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },

  -- Testing
  'vim-test/vim-test',

  -- Misc
  'startup-nvim/startup.nvim', -- Startup screen
  'RRethy/vim-illuminate', -- Highlight other uses of word under cursor
  { "lukas-reineke/indent-blankline.nvim" }, -- Show indent lines
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  'nvim-lualine/lualine.nvim',
  {
    'j-hui/fidget.nvim',
    tag='legacy'
  },
  'ten3roberts/window-picker.nvim',
  'https://gitlab.com/yorickpeterse/nvim-window.git',
  'folke/todo-comments.nvim',

  -- Themes
  {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy=false,
		config = function()
			vim.cmd([[colorscheme catppuccin-macchiato]])
		end,
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
