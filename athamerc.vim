" show paranthesis match
set showmatch

" search stop at bottom/top of page
set nowrapscan

"TAB SETTINGS
set tabstop=4 softtabstop=4 expandtab

" KEYBOARD SHORTCUTS
let mapleader=","

" Pasting from system keyboard easily
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "*y
noremap <Leader>P "*p

" jk is escape
imap jk 

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'

" Initialize plugin system
call plug#end()
