" blinds.vim:		Emphasize the current window by shading the non-fucussed windows
" Last Modified: Mi 31. Okt 2018 16:45:46 +0100 CET
" Author:		Jan Christoph Ebersbach <jceb@e-jc.de>
" Version:		0.2

if (exists("g:loaded_blinds") && g:loaded_blinds) || &cp
    finish
endif
let g:loaded_blinds= 1

if !exists("g:blinds_fg")
    let g:blinds_fg = "DarkGray"
endif

if !exists("g:blinds_hl")
    let g:blinds_hl = "Gray"
endif

function! s:SetBlinds()
    exec "hi Blinds ctermfg=".g:blinds_fg
    exec "hi Blinds_hl ctermfg=".g:blinds_hl
endfun

augroup blinds
    au!
    au WinEnter,BufWinEnter * setlocal winhighlight=
"    au WinLeave * setlocal winhighlight=ColorColumn:Blinds,CursorColumn:Blinds,CursorLine:Blinds,EndOfBuffer:Blinds,LineNr:Blinds,CursorLineNr:Blinds,CursorLineSign:Blinds,CursorLineFold:Blinds,NonText:Blinds,Normal:Blinds,FoldColumn:Blinds,SignColumn:Blinds,VertSplit:Blinds,Whitespace:Blinds,WinSeparator:Blinds
    au WinLeave * setlocal winhighlight=Normal:Blinds,Statement:Blinds,StatusLine:Blinds,StatusLineNC:Blinds
    au WinLeave * setlocal winhighlight+=Comment:Blinds_hl,Constant:Blinds_hl,Identifier:Blinds_hl,Function:Blinds_hl,Statement:Blinds_hl,PreProc:Blinds_hl,Type:Blinds_hl,Special:Blinds_hl,Delimiter:Blinds_hl,Visual:Blinds_hl,NonText:Blinds_hl,Pmenu:Blinds_hl,PmenuSel:Blinds_hl,LineNr:Blinds_hl
    au ColorScheme * call s:SetBlinds()
augroup END

call s:SetBlinds()
