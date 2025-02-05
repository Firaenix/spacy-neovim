function! Dot(path)
  return "~/.config/nvim/" . a:path
endfunction

for file in split(glob(Dot("modules/*.vim")), "\n")
  execute "source" file
endfor

for file in split(glob(Dot("modules/*.lua")), "\n")
  execute "source" file
endfor

for file in split(glob(Dot("autoload/*.vim")), "\n")
  execute "source" file
endfor

for file in split(glob(Dot("syntax/*.vim")), "\n")
  execute "source" file
endfor

if filereadable("~/.nvim.local.vim")
  source ~/.nvim.local.vim
endif

