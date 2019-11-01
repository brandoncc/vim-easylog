" easylog.vim - log vaiable easily
" Author: Joey
" Version: 0.0.0

" if exists("g:loaded_easylog") || v:version < 700
"   finish
" endif
" let g:loaded_easylog = 1

function! s:Js_Log() abort
  execute "normal! yiwoconsole.log(\"\<esc>pa\", \<esc>pa)"
endfunction

function! s:Vim_Log() abort
  execute "normal! yiwoecho \<esc>p"
endfunction

function! s:Go_Log() abort
  execute "normal! yiwofmt.Println(\"\<esc>pa\", \<esc>pa)"
endfunction

function! s:Python_Log() abort
  execute "normal! yiwoprint(\"\<esc>pa\", \<esc>pa)"
endfunction

function! s:UnSupport_Log() abort
  let l:msg="<Not support this filetype. 尚不支持此文件类型>"
  execute "normal! o".l:msg
endfunction

function! s:Match_File_Type() abort
  if &filetype ==# 'vim'
    call s:Vim_Log()
  elseif &filetype ==# 'javascript'
    call s:Js_Log()
  elseif &filetype ==# 'go'
    call s:Go_Log()
  elseif &filetype ==# 'python'
    call s:Python_Log()
  else
    call s:UnSupport_Log()
  endif
endfunction

nnoremap <plug>(Easy_log) :<C-u>call <SID>Match_File_Type()<cr>
nmap <leader>l <Plug>(Easy_log)

