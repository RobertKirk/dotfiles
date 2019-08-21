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
" unimpaired{{{
nmap < [
nmap > ]

omap < [
omap > ]

xmap < [
xmap > ]

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
" Finding Files
Plug 'jremmen/vim-ripgrep'
Plug 'Yggdroot/indentLine'

" Linting/completion/syntax
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'

" navigation
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

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
" defx-{git|icons|}{{{
" from https://github.com/taigacute/ThinkVim/blob/master/core/plugins/defx.vim
map <silent> <C-n> :Defx -search=`expand('%:p')` -toggle -ignored-files='.mypy_cache,__pycache__' -columns=indent:mark:filename:type<CR>

let g:defx_icons_enable_syntax_highlight = 0

call defx#custom#option('_', {
\ 'winwidth': 30,
\ 'split': 'vertical',
\ 'direction': 'topleft',
\ 'root_marker': ':',
\ })

call defx#custom#column('filename', {
\ 'root_marker_highlight': 'Ignore',
\ })

let g:defx_git#indicators = {
	\ 'Modified'  : '•',
	\ 'Staged'    : '✚',
	\ 'Untracked' : 'ᵁ',
	\ 'Renamed'   : '≫',
	\ 'Unmerged'  : '≠',
	\ 'Ignored'   : 'ⁱ',
	\ 'Deleted'   : '✖',
	\ 'Unknown'   : '⁇'
\ }

" Close defx if it's the only buffer left in the window
autocmd WinEnter * if &ft == 'defx' && winnr('$') == 1 | q | endif

" Move focus to the next window if current buffer is defx
autocmd TabLeave * if &ft == 'defx' | wincmd w | endif

autocmd FileType defx do WinEnter | call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> l  defx#do_action('drop')
  nnoremap <silent><buffer><expr> <CR>     <sid>defx_toggle_tree()
	nnoremap <silent><buffer><expr> s     defx#do_action('multi', [['open', 'vsplit'], 'quit'])
	nnoremap <silent><buffer><expr> i     defx#do_action('multi', [['drop', 'split'], 'quit'])
  nnoremap <silent><buffer><expr> ts    defx#do_action('multi', [['drop', 'tabnew'], 'quit'])
	nnoremap <silent><buffer><expr> gs    defx#do_action('multi', [['drop', 'botright vsplit'], 'quit'])
	nnoremap <silent><buffer><expr> vs    defx#do_action('multi', [['drop', 'botright split'], 'quit'])
  nnoremap <silent><buffer><expr> P     defx#do_action('open', 'pedit')
	nnoremap <silent><buffer><expr> K     defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N     defx#do_action('new_multiple_files')
	nnoremap <silent><buffer><expr> dd    defx#do_action('remove')
	nnoremap <silent><buffer><expr> r     defx#do_action('rename')
	nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> h     defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> ~     defx#async_action('cd')
	nnoremap <silent><buffer><expr> q     defx#do_action('quit')

	nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
	nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
	nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
	nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')

	nnoremap <silent><buffer><expr><nowait> <Space> defx#do_action('toggle_select') . 'j'

	nnoremap <silent><buffer><expr> *      defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
	nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')

	nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'Time')
	nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'indent:mark:filename:type:size:time')
endfunction

function! s:defx_toggle_tree() abort
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  endif
  return defx#do_action('multi', ['drop', 'quit'])
endfunction

"}}}
"}}}
" vim:foldmethod=marker:foldlevel=0
