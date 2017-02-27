# Design/Library Exchange Formats syntax files

This repository contains a copy of the `LEF_DEF_syntax` files created by [Levon Ohanyan](http://www.vim.org/account/profile.php?user_id=67412) that you can find on [vim.org](http://www.vim.org/account/profile.php?user_id=67412).

This copy is just here to simplify their installation using a plugin manager (like [Vundle](https://github.com/VundleVim/Vundle.vim) or [Plug](https://github.com/junegunn/vim-plug)).

----

*Original readme*

----

How to install DEF (Design Exchange Format) and LEF (Library Exchange Format) syntax files:

## For UNIX:
 1. Copy `syntax/*` to `$HOME/.vim/syntax/`
 2. Copy `ftdetect/*` to `/home/.vim/ftdetect/`
 3. Add to your .vimrc file following lines:
```
    autocmd FileType lef so ~/.vim/syntax/lef.vim
    autocmd FileType def so ~/.vim/syntax/def.vim
```

## For Windows:
 1. Copy `syntax/*` to `C:\Program Files (x86)\Vim\vimfiles\syntax\ `
 2. Copy `ftdetect/*` to `C:\Program Files (x86)\Vim\vimfiles\ftdetect\ `
