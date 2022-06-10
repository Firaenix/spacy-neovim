set termguicolors
set list
set nospell
set wildmenu
set wildmode=list:longest,full
set mouse=a
set updatetime=10
set sessionoptions=blank,curdir,folds,help,tabpages,winsize
set number

au BufRead,BufNewFile,BufReadPost *.metal setfiletype metal

lua << EOF
vim.opt.listchars = {
  eol = " ",
  extends = "↷",
  precedes = "↶",
  tab = "→ ",
  trail = "·"
}
EOF
