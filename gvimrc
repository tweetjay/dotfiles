"#################################################
"# Maintainer:	Johannes Steudle                ##
"# Last change:	2010/05/14                      ##
"# .gvimrc                                      ##
"#                                              ##
"#     for Unix and OS/2:  ~/.gvimrc            ##
"#################################################


" --------------------
" Make external commands work through a pipe instead of a pseudo-tty
" --------------------
"set noguipty

" --------------------
"set the X11 font to use
" --------------------
set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
" set guifont=DejaVu\ Sans\ Mono\ 9
" set guifont=Liberation\ Mono\ 9
" set guifont=Nimbus\ Mono\ L\ 10

set mousehide	    " Hide the mouse when typing text
set tabpagemax=15

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" --------------------
" Only do this for Vim version 5.0 and later.
" --------------------
if version >= 500
  set guioptions-=T " remove toolbar
  set guioptions-=m " remove menubar
  " set relativenumber
 
  " I like highlighting strings inside C comments
  let c_comment_strings=1

  set lines=70
  set columns=90

  " set transparency=8
  " colorscheme johannes

  " Switch on syntax highlighting if it wasn't on yet.
  " if !exists("syntax_on")
	" syntax off
	" syntax on
  " endif

endif

" --------------------
" SPELLCHECKING
" --------------------
fun SetSpellCheck()
  set spell spelllang=en,de		    " Spell checking language
  set spell spellsuggest=double,10	" Description of the spell-checker
									" zg to add word to word list
									" zw to reverse
									" zug to remove word from word list
									" z= to get list of possibilities
endfun

" --------------------
" looks for DokuWiki headlines in the first 20 lines
" of the current buffer
" --------------------
fun IsDokuWiki()
  if match(getline(1,20),'^ \=\(=\{2,6}\).\+\1 *$') >= 0
    set textwidth=0
    set wrap
    set linebreak
    set filetype=dokuwiki
  endif
endfun
 
" check for texfile
autocmd BufWinEnter *.tex,*.txt call SetSpellCheck()

" check for dokuwiki syntax
autocmd BufWinEnter *.txt call IsDokuWiki()
 
" --------------------
" ShowMarks
" --------------------
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Don't leave on by default, use :ShowMarksOn to enable
let g:showmarks_enable = 0
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
