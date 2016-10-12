if exists("g:loaded_buftimer")||&compatible||!has("autocmd") | finish | endif
let g:loaded_buftimer = 1

" Using line continuation
let s:cpo_hold = &cpoptions
set cpoptions&vim

let s:fp   = 702 " First official floating point version
let s:list = 700 " First official List version

if !exists('g:btrOpt') | let g:btrOpt = 0 | endif
let s:zero = v:version >= s:fp ? 0.0 : 0

augroup BufTimer
  autocmd!
  autocmd VimEnter,BufRead,BufNew * if !exists('b:timeStart')
	\| let b:timeStart = reltime() | let b:timeAccum = s:zero | endif
  autocmd BufLeave * let b:timeAccum = s:BufTimerCalc()
  autocmd BufEnter * let b:timeStart = reltime() | if !exists('b:timeAccum')
	\| let b:timeAccum = s:zero | endif
  autocmd FocusGained * let b:timeStart = reltime()
  autocmd FocusLost * let b:timeAccum = s:BufTimerCalc()
augroup END

if v:version >= s:fp
  function s:BufTimerCalc()
    return str2float(reltimestr(reltime(b:timeStart))) + b:timeAccum
  endfunction

  function s:Secs2Str(secs)
    let hours=floor(a:secs/3600)
    let minutes=floor((a:secs-hours*3600)/60)
    let seconds=a:secs-hours*3600-minutes*60
    return printf("%0.0f:%02.0f:%02.0f",hours,minutes,seconds)
  endfunction
else
  function s:BufTimerCalc()
    return str2nr(reltimestr(reltime(b:timeStart))) + b:timeAccum
  endfunction

  function s:Secs2Str(secs)
    let hours=a:secs/3600
    let minutes=(a:secs-hours*3600)/60
    let seconds=a:secs-hours*3600-minutes*60
    return printf("%d:%02d:%02d",hours,minutes,seconds)
  endfunction
endif

function s:BufTimer()
  let secs = v:version >= s:fp ? round(s:BufTimerCalc()) : s:BufTimerCalc()
  if exists('s:total') | let s:total += secs | endif
  return s:Secs2Str(secs)
endfunction

command BufTimer echo s:BufTimer()
nmap <silent> <Plug>BTmap :BufTimer<CR>
if !hasmapto("<Plug>BTmap")
  nmap <unique> <leader>dt <Plug>BTmap
endif

if v:version >= s:list
  let s:BTRtitles = ["-----Existing Buffers-----",
		\"------Loaded Buffers------",
		\"------Listed Buffers------"]
  function s:BufTimerReport()
    if !exists('g:btrOpt') || g:btrOpt < 0 || g:btrOpt > 2
      echomsg 'Bad g:btrOpt'
      return
    endif
    let s:total = s:zero
    let report = [s:BTRtitles[g:btrOpt],
		\"Buf  hh:mm:ss  Buffer Name",
		\"---  --------  -----------"]
    let curbuf = bufnr('%')

    for i in range(1,bufnr('$'))
      if !g:btrOpt && bufexists(i)
		\|| g:btrOpt == 1 && bufloaded(i)
		\|| g:btrOpt == 2 && buflisted(i)
	silent execute 'b'.i
	let str = printf("%3d %9s  %s", i, s:BufTimer(), bufname(i))
	call add(report, str)
      endif
    endfor

    silent execute 'b'.curbuf

    for i in report
      echo i
    endfor

    echo "---  --------"
    echo printf("Tot %9s",s:Secs2Str(s:total))
    unlet s:total
  endfunction

  command BufTimerReport call s:BufTimerReport()
  nmap <silent> <Plug>BTRmap :BufTimerReport<CR>

  if !hasmapto("<Plug>BTRmap")
    nmap <unique> <leader>dr <Plug>BTRmap
  endif
endif

" restore 'cpoptions'
let &cpoptions = s:cpo_hold
unlet s:cpo_hold

" vim: sw=2 sts=2 ts=8 tw=79
