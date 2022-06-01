Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'embear/vim-localvimrc'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vim-better-default'
Plug 'radenling/vim-dispatch-neovim'
Plug 'rafi/awesome-vim-colorschemes'
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
" Plug 'simrat39/rust-tools.nvim' - Inlay hints are a bit annoying.
Plug 'timonv/vim-cargo'

if has('mac') 
  Plug 'mrjones2014/dash.nvim', { 'do': 'make install' }
endif

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'brgmnn/vim-opencl'
Plug 'saecki/crates.nvim', { 'tag': 'v0.2.1' }

"Coq
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'jose-elias-alvarez/typescript.nvim'

Plug 'hashivim/vim-terraform'

" Theming
Plug 'stevearc/dressing.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/dashboard-nvim'
Plug 'Pocco81/AutoSave.nvim'
