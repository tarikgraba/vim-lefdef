" Vim filetype plugin file
" Language:	DEF (Design Exchange Format)
" Maintainer:	Levon Ohanyan <lvnohanyan@gmail.com>
" Last Change:	Mon Nov 18 13:41:18 AMT 2013
" Version: 1.0

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

au BufNewFile,BufRead *.def set filetype=def
