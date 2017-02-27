" Vim filetype plugin file
" Language:	LEF (Library Exchange Format)
" Maintainer:	Levon Ohanyan <lvnohanyan@gmail.com>
" Last Change:	Mon Nov 18 15:31:24 AMT 2013
" Version: 1.0

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

au BufNewFile,BufRead *.lef set filetype=lef
