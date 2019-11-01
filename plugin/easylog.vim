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

function! s:Find_File_Type() abort
  if &filetype ==# 'vim'
    call s:Vim_Log()
  elseif &filetype ==# 'javascript'
    call s:Js_Log()
  elseif &filetype ==# 'go'
    call s:Go_Log()
  endif
endfunction

nnoremap <plug>(Easy_log) :<C-u>call <SID>Find_File_Type()<cr>
nmap <leader>l <Plug>(Easy_log)

