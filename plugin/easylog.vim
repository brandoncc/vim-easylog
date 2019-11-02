" easylog.vim - log vaiable easily
" Author: Joey
" Version: 0.0.1

" todo：
" -[x] v模式下打印
" -[x] L打印在上方
" -[] 重新映射
" -[] 深拷贝打印

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


function! s:Normal_Log_Model(language, word, is_upper) abort
  if a:is_upper
    let l:next_line="O"
  else
    let l:next_line="o"
  endif
  execute "normal! ".l:next_line.s:log_map[a:language]."(\"".a:word."\", ".a:word.")"
endfunction


function! s:Vim_Log(word, is_upper) abort
  if a:is_upper
    let l:next_line="O"
  else
    let l:next_line="o"
  endif
  execute "normal! ".l:next_line."echom ".a:word
endfunction

function! s:UnSupport_Log() abort
  let l:msg="<easylog: No support for this filetype. 尚不支持此文件类型>"
  echo l:msg
endfunction


function! s:Match_File_Type(mode, is_upper) abort
  if a:mode == 0
    let l:word = expand("<cword>")
  elseif a:mode ==1
    let l:word = s:get_visual_selection()
  endif

  if has_key(s:log_map, &filetype)
    call s:Normal_Log_Model(&filetype, l:word, a:is_upper)
  elseif &filetype ==# 'vim'
    call s:Vim_Log(l:word, a:is_upper)
  else
    call s:UnSupport_Log()
  endif
endfunction

" normal=0, visual=1
nnoremap <plug>(Normal_Easy_Log) :<C-u>call <SID>Match_File_Type(0, v:false)<cr>

nnoremap <plug>(Normal_Upper_Easy_Log) :<C-u>call <SID>Match_File_Type(0, v:true)<cr>

vnoremap <plug>(Visual_Easy_Log) :<C-u>call <SID>Match_File_Type(1, v:false)<cr>

vnoremap <plug>(Visual_Upper_Easy_Log) :<C-u>call <SID>Match_File_Type(1, v:true)<cr>


if !hasmapto('<plug>(Normal_Easy_Log)') || maparg('<leader>l', 'n') ==# ''
  nmap <leader>l <Plug>(Normal_Easy_Log)
endif

if !hasmapto('<plug>(Normal_Upper_Easy_Log)') || maparg('<leader>L', 'n') ==# ''
  nmap <leader>L <Plug>(Normal_Upper_Easy_Log)
endif

if !hasmapto('<plug>(Visual_Easy_Log)') || maparg('<leader>l', 'v') ==# ''
  vmap <leader>l <Plug>(Visual_Easy_Log)
endif

if !hasmapto('<plug>(Visual_Upper_Easy_Log)') || maparg('<leader>L', 'v') ==# ''
  vmap <leader>L <Plug>(Visual_Upper_Easy_Log)
endif
