" easylog.vim - log vaiable easily
" Author: Joey
" Version: 0.0.1

" todo：
" - v模式下打印

if exists("g:loaded_easylog") || v:version < 700
  finish
endif
let g:loaded_easylog = 1


let s:log_map={
      \'javascript':'console.log',
      \'go':'fmt.Println',
      \'python':'print',
      \}


function! s:Normal_Log_Model(language) abort
  let l:word = expand("<cword>")
  execute "normal! o".s:log_map[a:language]."(\"".l:word."\", ".l:word.")"
endfunction

function! s:Vim_Log() abort
  let l:word = expand("<cword>")
  execute "normal! oechom ".l:word
endfunction

function! s:UnSupport_Log() abort
  let l:msg="<easylog: No support for this filetype. 尚不支持此文件类型>"
  echo l:msg
endfunction


function! s:Match_File_Type() abort
  if has_key(s:log_map, &filetype)
    call s:Normal_Log_Model(&filetype)
  elseif &filetype ==# 'vim'
    call s:Vim_Log()
  else
    call s:UnSupport_Log()
  endif
endfunction

nnoremap <plug>(Easy_log) :<C-u>call <SID>Match_File_Type()<cr>

if !hasmapto('<plug>(Easy_log)') || maparg('<leader>l', 'n') ==# ''
  nmap <leader>l <Plug>(Easy_log)
endif

if !hasmapto('<plug>(Easy_log)') || maparg('<leader>l', 'v') ==# ''
  nmap <leader>l <Plug>(Easy_log)
endif

