"easylog.vim - log vaiable easily
" Author: Joey
" Version: 0.0.0

" if exists("g:loaded_easylog") || v:version < 700
"   finish
" endif
" let g:loaded_easylog = 1

function! s:Js_log() abort
  echo "1"
  normal! yiwoconsole.log()\<Esc>
endfunction
noremap <buffer> <localleader>l :call s:Js_log()<cr>
