" easylog.vim - log vaiable easily
" Author: Joey
" Version: 0.1.0

if exists("g:loaded_easylog") || v:version < 700 || &compatible
  finish
endif
let g:loaded_easylog = 1


" map {{{
let s:log_map={
      \'javascript':['console.log("', '", ', ')'],
      \'go':['fmt.Println("', '", ', ')'],
      \'python':['print("', '", ', ')'],
      \'vim':['echo "', ': "',''],
      \}

let s:type_map={
      \'javascript':['console.log("', ': ", Object.prototype.toString.call(', '))'],
      \'go':['fmt.Printf("', ': %T\n", ', ')'],
      \'python':['print("', ': ", type(', '))'],
      \'vim':['echom "', ': ".type(',')'],
      \}
" }}}

" tools {{{
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


function! s:UnSupport_Log() abort
  let l:msg="<easylog: No support for this filetype. 尚不支持此文件类型>"
  echo l:msg
endfunction

" }}}

" main {{{
" ======== vaiables ========
" l:next_log_line
" l:easy_log_mode      " normal=0, visual=1
" l:selected_word

function! s:Easy_Log_Main(mode, log_code, is_upper) abort
  if a:mode == 0         " normal
    let l:selected_word = expand("<cword>")
  elseif a:mode ==1      " visual
    let l:selected_word = s:get_visual_selection()
  endif

  if a:log_code == 0         " normal
    let l:log_code_map=s:log_map
  elseif a:log_code ==1      " type
    let l:log_code_map=s:type_map
  endif

  if a:is_upper
    let l:next_log_line="O"
  else
    let l:next_log_line="o"
  endif

  if has_key(l:log_code_map, &filetype)
    execute "normal! ".l:next_log_line.join(l:log_code_map[&filetype], l:selected_word)
  else
    call s:UnSupport_Log()
  endif
endfunction

" }}}


" ==== 所有映射 ====={{{
" 抽象一时爽，写入口火葬场
" normal=0, visual=1
" normal=0, type=1

nnoremap <plug>(Normal_Easy_Log) :<C-u>call <SID>Easy_Log_Main(0, 0, v:false)<cr>

nnoremap <plug>(Normal_Upper_Easy_Log) :<C-u>call <SID>Easy_Log_Main(0, 0, v:true)<cr>

vnoremap <plug>(Visual_Easy_Log) :<C-u>call <SID>Easy_Log_Main(1, 0, v:false)<cr>

vnoremap <plug>(Visual_Upper_Easy_Log) :<C-u>call <SID>Easy_Log_Main(1, 0, v:true)<cr>


nnoremap <plug>(Normal_Type_Easy_Log) :<C-u>call <SID>Easy_Log_Main(0, 1, v:false)<cr>

nnoremap <plug>(Normal_Type_Upper_Easy_Log) :<C-u>call <SID>Easy_Log_Main(0, 1, v:true)<cr>

vnoremap <plug>(Visual_Type_Easy_Log) :<C-u>call <SID>Easy_Log_Main(1, 1, v:false)<cr>

vnoremap <plug>(Visual_Type_Upper_Easy_Log) :<C-u>call <SID>Easy_Log_Main(1, 1, v:true)<cr>

" }}}



if !exists('g:easy_log_map_key')
  let g:easy_log_map_key='<leader>l'
endif

if !exists('g:easy_log_upper_map_key')
  let g:easy_log_upper_map_key='<leader>L'
endif


if !exists('g:easy_log_type_map_key')
  let g:easy_log_type_map_key='<leader>tl'
endif

if !exists('g:easy_log_type_upper_map_key')
  let g:easy_log_type_upper_map_key='<leader>tL'
endif



if !hasmapto('<plug>(Normal_Easy_Log)') || maparg('<leader>l', 'n') ==# ''
  execute 'nmap '.g:easy_log_map_key.' <Plug>(Normal_Easy_Log)'
endif

if !hasmapto('<plug>(Visual_Easy_Log)') || maparg('<leader>l', 'v') ==# ''
  execute 'vmap '.g:easy_log_map_key.' <Plug>(Visual_Easy_Log)'
endif


if !hasmapto('<plug>(Normal_Upper_Easy_Log)') || maparg('<leader>L', 'n') ==# ''
  execute 'nmap '.g:easy_log_upper_map_key.' <Plug>(Normal_Upper_Easy_Log)'
endif

if !hasmapto('<plug>(Visual_Upper_Easy_Log)') || maparg('<leader>L', 'v') ==# ''
  execute 'vmap '.g:easy_log_upper_map_key.' <Plug>(Visual_Upper_Easy_Log)'
endif

" ==============
if !hasmapto('<plug>(Normal_Type_Easy_Log)') || maparg('<leader>tl', 'n') ==# ''
  execute 'nmap '.g:easy_log_type_map_key.' <Plug>(Normal_Type_Easy_Log)'
endif

if !hasmapto('<plug>(Visual_Type_Easy_Log)') || maparg('<leader>tl', 'v') ==# ''
  execute 'vmap '.g:easy_log_type_map_key.' <Plug>(Visual_Type_Easy_Log)'
endif


if !hasmapto('<plug>(Normal_Type_Upper_Easy_Log)') || maparg('<leader>tL', 'n') ==# ''
  execute 'nmap '.g:easy_log_type_upper_map_key.' <Plug>(Normal_Type_Upper_Easy_Log)'
endif

if !hasmapto('<plug>(Visual_Type_Upper_Easy_Log)') || maparg('<leader>tL', 'v') ==# ''
  execute 'vmap '.g:easy_log_type_upper_map_key.' <Plug>(Visual_Type_Upper_Easy_Log)'
endif

