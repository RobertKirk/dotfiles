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

" Easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" move to word
map  <Leader>wo <Plug>(easymotion-bd-w)
nmap <Leader>wo <Plug>(easymotion-overwin-w)

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'

" Initialize plugin system
call plug#end()
