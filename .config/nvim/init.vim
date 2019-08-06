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
set laststatus=1
set shellcmdflag=-ic
set title

let g:python3_host_prog = '/usr/bin/python3.7'
"}}}
" VIEW SETTINGS{{{
set signcolumn=yes

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
set background=light
colors solarized

highlight EndOfBuffer ctermfg=7
highlight SignColumn ctermbg=7
highlight VertSplit ctermbg=15
highlight VertSplit ctermfg=15
" set cursorcolumn      " highlight current column
" highlight CursorColumn ctermbg=8

" Changing cursor shape per mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
if exists('$TMUX')
    " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
    let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
    let &t_SR .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
    let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
    autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
else
    let &t_SI .= "\<Esc>[6 q"
    let &t_SR .= "\<Esc>[4 q"
    let &t_EI .= "\<Esc>[2 q"
    autocmd VimLeave * silent !echo -ne "\033[0 q"
endi

" keep the cursor on the screen
set scrolloff=10
set scrolljump=2

" Return to last position on opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" folding
set foldenable
set foldlevelstart=10   " open most folds by default
set foldmethod=indent

set norelativenumber
set nonumber

" TAB SETTINGS
set tabstop=2 softtabstop=2 expandtab

"}}}
" SEARCH SETTINGS{{{
" Ignore case when searching
set ignorecase
set smartcase
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

nnoremap <leader>g :Rg<CR>
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
"}}}
" KEYBOARD SHORTCUTS{{{
let mapleader=" "

" Move to the next buffer
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Pasting from system keyboard easily
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>Y "*y
noremap <leader>P "*p
nnoremap mp :!mdtex2pdf % <CR><CR>

" leader x closes the buffer
nmap <leader>x :bp<bar>sp<bar>bn<bar>bd<CR>
" leader q exits
nmap <leader>q :xa<cr>

" CR open/closes folds
nnoremap <CR> za

" jk is escape
inoremap jk <esc>

nnoremap <leader>n :set number!<CR>

" Pressing ss will toggle and untoggle spell checking
map <leader>s :setlocal spell!<cr>
" ctrl l recorrects last spelling mistake
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"}}}
" FILE SPECIFIC CONFIGS{{{
augroup configgroup
    autocmd!
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter gitcommit, COMMIT_EDITMSG setlocal colorcolumn=80
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.zsh setlocal tabstop=2
    autocmd BufEnter *.zsh setlocal shiftwidth=2
    autocmd BufEnter *.zsh setlocal softtabstop=2
augroup END

filetype plugin indent on
syntax on

"}}}
" VIM BACKUP{{{
" backup to separate folder
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"}}}
" TMUX PANE NAVIGATION{{{
" tmux navigation with vim splits as well
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-w> :TmuxNavigatePrevious<cr>
let g:tmux_navigator_save_on_switch = 1

"}}}
" MACROS & FUNCTIONS{{{
" Auto rebase move
let @r = 'gg/\n\nBww"8ywVd?a:pcwfjk, '

" convert rows of numbers or text (as if pasted from excel column) to a tuple
function! ToTupleFunction() range
    silent execute a:firstline . "," . a:lastline . "s/^/'/"
    silent execute a:firstline . "," . a:lastline . "s/$/',/"
    silent execute a:firstline . "," . a:lastline . "join"
    silent execute "normal I("
    silent execute "normal Exa)"
endfunction

command! -range ToTuple <line1>,<line2> call ToTupleFunction()

"}}}
" PLUGINS PRE LOAD{{{
" Easymotion{{{
" <Leader>f{char} to move to {char}
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
" <leader>s{char}{char} to move to {char}{char}
" nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" move to word
map  <Leader>wo <Plug>(easymotion-bd-w)
nmap <Leader>wo <Plug>(easymotion-overwin-w)

"}}}
" ALE setup{{{
let g:ale_completion_enabled = 0
let g:ale_linters = {
    \ 'sh': ['language_server'],
    \ }
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %(code):% %s [%severity%]'

nnoremap <silent> <C-f> :ALEFix<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"}}}
" GitGutter setup{{{
let g:gitgutter_map_keys = 0
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk
nmap <Leader>gp <Plug>GitGutterPreviewHunk

"}}}
" NoSwapSuck{{{
so ~/scripts/vim/noswapsuck.vim
set backupcopy=yes

"}}}
" CtrlP{{{
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'
let g:cpsm_query_inverting_delimiter = ' '
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_clear_cache_on_exit = 0

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
" vimtex{{{
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtext_fold_enabled = 1

"}}}
"}}}
" Autoloading vim plugins{{{
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

"}}}
" Loading Plugins{{{
call plug#begin('~/.config/nvim/plugged')
" Finding Files
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nixprime/cpsm'
Plug 'jremmen/vim-ripgrep'

" Linting/completion/syntax
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'kovetskiy/sxhkd-vim', { 'for': 'sxhkd' }
Plug 'neomutt/neomutt.vim', { 'for': 'neomuttrc' }

" navigation
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/defx.nvim'
" Plug 'kristijanhusak/defx-git'
" Plug 'kristijanhusak/defx-icons'

" motions/objects/actions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'wellle/targets.vim'
Plug 'romainl/vim-cool'
Plug 'markonm/traces.vim'

" folding
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'

" Windows/panes/status
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'simeji/winresizer'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'

" Utils
Plug 'sk1418/HowMuch'
Plug 'vimwiki/vimwiki'
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
