" easylog.vim - log vaiable easily
" Author: Joey
" Version: 0.0.0

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
  execute "normal! yiwo".s:log_map[a:language]."(\"\<esc>pa\", \<esc>pa)"
endfunction

function! s:Vim_Log() abort
  execute "normal! yiwoecho \<esc>p"
endfunction

function! s:UnSupport_Log() abort
  let l:msg="<Not support this filetype. 尚不支持此文件类型>"
  execute "normal! o".l:msg
endfunction


function! s:Match_File_Type() abort
  if &filetype ==# 'vim'
    call s:Vim_Log()
  elseif &filetype ==# 'javascript'
    call s:Normal_Log_Model('javascript')
  elseif &filetype ==# 'go'
    call s:Normal_Log_Model('go')
  elseif &filetype ==# 'python'
    call s:Normal_Log_Model('python')
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
