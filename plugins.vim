Plug 'airblade/vim-gitgutter'
Plug 'ggandor/leap.nvim'
Plug 'embear/vim-localvimrc'
" Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vim-better-default'
Plug 'radenling/vim-dispatch-neovim'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-lualine/lualine.nvim'
" Rust
Plug 'rust-lang/rust.vim'
Plug 'mfussenegger/nvim-dap'
Plug 'simrat39/rust-tools.nvim'
Plug 'timonv/vim-cargo'
Plug 'bogado/file-line'

if has('mac') 
  Plug 'mrjones2014/dash.nvim', { 'do': 'make install' }
endif

Plug 'folke/trouble.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'evanleck/vim-svelte'
" Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

"Coq
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

Plug 'akinsho/toggleterm.nvim', { 'tag': '2.3.0' }

" Theming
Plug 'stevearc/dressing.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/dashboard-nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'folke/lsp-colors.nvim'
Plug 'tanvirtin/monokai.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'NvChad/nvim-colorizer.lua'


Plug 'brgmnn/vim-opencl'
Plug 'saecki/crates.nvim', { 'tag': 'v0.2.1' }
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'cstrahan/vim-capnp'

" Misc
Plug 'jackMort/ChatGPT.nvim'
