" easylog.vim - log vaiable easily
" Author: Joey
" Version: 0.0.1

" todo：
" -[x] v模式下打印
" -[] 深拷贝打印
" -[] L打印在上方

if exists("g:loaded_easylog") || v:version < 700
  finish
endif
let g:loaded_easylog = 1


" s:log_map {{{
let s:log_map={
      \'javascript':'console.log',
      \'go':'fmt.Println',
      \'python':'print',
      \}
" }}}

" s:get_visual_selection {{{
function! s:get_visual_selection() abort
  let [line_start, column_start] = getpos("'<")[1: 2]
  let [line_end, column_end] = getpos("'>")[1: 2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    let l:msg="<easylog: No selection. 尚未选中>"
    echom l:msg
    finish
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1: ]
  return join(lines, "\n")
endfunction
" }}}


function! s:Normal_Log_Model(language, word) abort
  execute "normal! o".s:log_map[a:language]."(\"".a:word."\", ".a:word.")"
endfunction

function! s:Vim_Log() abort
  execute "normal! oechom ".a:word
endfunction

function! s:UnSupport_Log() abort
  let l:msg="<easylog: No support for this filetype. 尚不支持此文件类型>"
  echo l:msg
endfunction


function! s:Match_File_Type(mode) abort
  if a:mode == 0
    let l:word = expand("<cword>")
  elseif a:mode ==1
    let l:word = s:get_visual_selection()
  endif

  if has_key(s:log_map, &filetype)
    call s:Normal_Log_Model(&filetype, l:word)
  elseif &filetype ==# 'vim'
    call s:Vim_Log(l:word)
  else
    call s:UnSupport_Log()
  endif
endfunction


" normal=0, visual=1
nnoremap <plug>(Normal_Easy_Log) :<C-u>call <SID>Match_File_Type(0)<cr>

if !hasmapto('<plug>(Easy_log)') || maparg('<leader>l', 'n') ==# ''
  nmap <leader>l <Plug>(Normal_Easy_Log)
endif

vnoremap <plug>(Visual_Easy_Log) :<C-u>call <SID>Match_File_Type(1)<cr>

if !hasmapto('<plug>(Visual_Easy_Log)') || maparg('<leader>l', 'v') ==# ''
  vmap <leader>l <Plug>(Visual_Easy_Log)
endif
