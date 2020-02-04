" Robert Kirk
" GENERIC SETTINGS{{{
set mouse=a
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
scriptencoding utf-8
set hidden
set nowrap
set encoding=UTF-8
set modelines=1
set autoread
set updatetime=100
set noshowmode
set lazyredraw
set nolist
syntax enable
filetype plugin indent on

let g:python3_host_prog = '/usr/bin/python3.7'
"}}}
" VIEW SETTINGS{{{
let g:solarized_menu = 0
set laststatus=0
set signcolumn=no
set background=light
colors solarized

highlight EndOfBuffer ctermfg=15
highlight SignColumn ctermbg=7
highlight VertSplit ctermbg=15
highlight VertSplit ctermfg=15

let &t_SI .= "\<Esc>[6 q"
let &t_SR .= "\<Esc>[4 q"
let &t_EI .= "\<Esc>[2 q"
autocmd VimLeave * silent !echo -ne "\033[0 q"

set norelativenumber
set nonumber
set noruler

" TAB SETTINGS
set tabstop=2 softtabstop=2 expandtab
set shiftwidth=2
"}}}
" KEYBOARD SHORTCUTS{{{
let mapleader=" "

" Pasting from system keyboard easily
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>Y "*y
noremap <leader>P "*p

nmap <leader>q :wq!<cr>
imap <C-c> <esc>:wq!<CR>
"
" jk is escape
inoremap jk <esc>

nnoremap <leader>n :set number!<CR>

" Pressing ss will toggle and untoggle spell checking
map <leader>s :setlocal spell!<cr>

" ctrl l recorrects last spelling mistake
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"}}}
" VIM BACKUP{{{
" backup to separate folder
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"}}}
" UltiSnips{{{
" Configuration for custom snips
let g:UltiSnipsSnippetsDir = "~/.config/nvim/snips"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]

" Trigger configuration.
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Use Python Version
let g:UltiSnipsUsePythonVersion = 3
"}}}
" SuperTab {{{
let g:SuperTabDefaultCompletionType = "<c-n>"

"}}}
" Goyo{{{
let g:goyo_width = 200

"}}}
" Yoink and Cutlass{{{
" yoink
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

nmap <c-w> <plug>(YoinkPostPasteSwapBack)
nmap <c-s> <plug>(YoinkPostPasteSwapForward)

nmap y <plug>(YoinkYankPreserveCursorPosition)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

let g:yoinkIncludeDeleteOperations = 1
let g:yoinkSyncSystemClipboardOnFocus = 0

" cutlass
xnoremap x d
nnoremap x d

nnoremap xx dd
nnoremap X D

"}}}
" vimtex{{{
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtext_fold_enabled = 1

"}}}
" Loading Plugins{{{
call plug#begin('~/.config/nvim/plugged')

" Linting/completion/syntax
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'

" motions/objects/actions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'wellle/targets.vim'
Plug 'romainl/vim-cool'
Plug 'markonm/traces.vim'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'tpope/vim-unimpaired'

" folding
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'

" Windows/panes/status
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Utils
Plug 'sk1418/HowMuch', { 'on': 'HowMuch' }
call plug#end()

"}}}
" PLUGINS POST LOAD{{{
" deoplete{{{
let g:deoplete#enable_at_startup = 0
call deoplete#custom#option('camel_case', v:true)
call deoplete#custom#option('max_list', 20)
call deoplete#custom#option('sources', {
\ 'python': ['around', 'file', 'member', 'jedi', 'tag'],
\})

call deoplete#custom#var('omni', 'input_patterns', {
\ 'pandoc': '@'
\})
"}}}
"}}}
" vim:foldmethod=marker:foldlevel=0
