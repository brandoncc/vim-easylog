let g:mru_files=[]
let g:mru_files_len=10

function s:MruAdd(path)
  let idx = index(g:mru_files, a:path)
  if idx >=0
    call remove(g:mru_files, idx)
  endif
  call insert(g:mru_files, a:path)
  let g:mru_fles=g:mru_files[:g:mru_files_len-1]
endfunction

autocmd BufWinLeave, BufWritePost * call s:MruAdd(expand('%:p'))
