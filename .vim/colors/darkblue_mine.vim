" Vim color file
" Maintainer:	Bohdan Vlasyuk <bohdan@vstu.edu.ua>
" Last Change:	2008 Jul 18

" darkblue -- for those who prefer dark background
" [note: looks bit uglier with come terminal palettes,
" but is fine on default linux console palette.]

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "darkblue_mine"

hi Normal		ctermfg=7 ctermbg=black
hi ErrorMsg		ctermfg=white ctermbg=lightblue
hi Visual		ctermfg=lightblue ctermbg=fg cterm=reverse
hi VisualNOS	ctermfg=lightblue ctermbg=fg cterm=reverse,underline
hi Todo			ctermfg=red	ctermbg=darkblue
hi Search		ctermfg=white ctermbg=darkblue
hi IncSearch	ctermfg=darkblue ctermbg=gray

hi SpecialKey	ctermfg=darkcyan
hi Directory	ctermfg=cyan
hi Title		ctermfg=magenta cterm=bold
hi WarningMsg	ctermfg=red
hi WildMenu		ctermfg=yellow ctermbg=black cterm=none term=none
hi ModeMsg		ctermfg=lightblue
hi MoreMsg		ctermfg=darkgreen
hi Question		ctermfg=green cterm=none
hi NonText		ctermfg=darkblue

hi StatusLine	ctermfg=blue ctermbg=gray term=none cterm=none
hi StatusLineNC	ctermfg=black ctermbg=gray term=none cterm=none
hi VertSplit    ctermbg=16 ctermfg=16

hi CursorColumn ctermbg=8

hi Folded	    ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi FoldColumn 	ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi LineNr	    ctermfg=14
hi CursorLineNr ctermfg=7
 
hi EndOfBuffer  ctermfg=0

hi DiffAdd	    ctermbg=darkblue term=none cterm=none
hi DiffChange	ctermbg=magenta cterm=none
hi DiffDelete	ctermfg=blue ctermbg=cyan
hi DiffText	    cterm=bold ctermbg=red

hi Cursor	    ctermfg=black ctermbg=yellow
hi lCursor	    ctermfg=black ctermbg=white

hi Comment	    ctermfg=darkred
hi Constant	    ctermfg=magenta cterm=none
hi Special	    ctermfg=brown cterm=none
hi Identifier	ctermfg=cyan cterm=none
hi Statement	ctermfg=yellow cterm=bold
hi PreProc	    ctermfg=magenta cterm=none
hi type		    ctermfg=green cterm=none
hi Underlined	cterm=underline term=underline
hi Ignore	    ctermfg=bg
