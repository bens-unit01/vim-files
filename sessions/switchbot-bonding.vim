" ~\vimfiles\sessions\switchbot-bonding.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 06 October 2016 at 13:41:13.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egrLt
silent! set guifont=Consolas:h10:cANSI
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'solarized' | colorscheme solarized | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~\Documents\Raouf\REPO\switchbot\microcontrollers\nordic\BLE_MEGA
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 \Users\user\Documents\Raouf\REPO\switchbot\microcontrollers\nordic\BLE_BEACON\main.c
badd +305 main.c
badd +19 debug.h
badd +154 ..\..\..\..\..\..\..\..\..\Development\ble\NORDIC_DEV_6\nrf51822_sdk\Source\ble\device_manager\device_manager_central.c
badd +1 ..\BLE_BEACON\debug.h
silent! argdel *
edit debug.h
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 28 + 29) / 58)
exe '2resize ' . ((&lines * 27 + 29) / 58)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 14 - ((6 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
14
normal! 02l
wincmd w
argglobal
edit main.c
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1758 - ((4 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1758
normal! 02l
wincmd w
exe '1resize ' . ((&lines * 28 + 29) / 58)
exe '2resize ' . ((&lines * 27 + 29) / 58)
tabedit \Users\user\Documents\Raouf\REPO\switchbot\microcontrollers\nordic\BLE_BEACON\main.c
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 28 + 29) / 58)
exe 'vert 1resize ' . ((&columns * 91 + 89) / 179)
exe '2resize ' . ((&lines * 26 + 29) / 58)
exe 'vert 2resize ' . ((&columns * 91 + 89) / 179)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 73 - ((15 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
73
normal! 058l
wincmd w
argglobal
edit ..\BLE_BEACON\debug.h
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 14 - ((13 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
14
normal! 02l
wincmd w
exe '1resize ' . ((&lines * 28 + 29) / 58)
exe 'vert 1resize ' . ((&columns * 91 + 89) / 179)
exe '2resize ' . ((&lines * 26 + 29) / 58)
exe 'vert 2resize ' . ((&columns * 91 + 89) / 179)
tabnext 1
if exists('s:wipebuf')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

1wincmd w
tabnext 1
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128