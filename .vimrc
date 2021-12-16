" Robert Kirk
" GENERIC SETTINGS{{{
set nocompatible
scriptencoding utf-8
set hidden
set encoding=UTF-8
set modelines=1
set autoread
set updatetime=100
"}}}
" VIEW SETTINGS{{{
syntax enable
set background=light
colors solarized

" set cursorcolumn      " highlight current column
" highlight CursorColumn ctermbg=8
set nowrap

" Changing cursor shape per mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" if exists('$TMUX')
"     " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
"     let &t_SI .= \<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
"     let &t_SR .= \<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
"     let &t_EI .= \<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
"     autocmd VimLeave * silent !echo -ne \033Ptmux;\033\033[0 q\033\\"
" else
"     let &t_SI .= \<Esc>[6 q"
"     let &t_SR .= \<Esc>[4 q"
"     let &t_EI .= \<Esc>[2 q"
"     autocmd VimLeave * silent !echo -ne \033[0 q"
" endi

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
" set t_Co=256

" keep the cursor on the screen
set scrolloff=5

" Return to last position on opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" folding 
set foldenable
set foldlevelstart=10   " open most folds by default
set foldmethod=indent

" only redraw when we need to
set lazyredraw

" show paranthesis match
set showmatch

" show relative line numbers
set relativenumber
set number

" TAB SETTINGS
set tabstop=4 softtabstop=4 expandtab

"}}}
" SEARCH SETTINGS{{{
" Ignore case when searching
set ignorecase
set smartcase
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"}}}
" POST lOAD fIXED{{{
function! CorrectColorScheme()
  "python3 from powerline.vim import setup as powerline_setup
  "python3 powerline_setup()
  highlight EndOfBuffer ctermfg=8
endfunction

autocmd VimEnter * call CorrectColorScheme()
"}}}
" KEYBOARD SHORTCUTS{{{
let mapleader="<space>"

" Move to the next buffer 
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one 
" This replicates the idea of closing a tab 
nmap <leader>bq :bp <BAR> bd #<CR> 
" Show all open buffers and their status 
nmap <leader>bl :ls<CR>

" leader <space> to turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Pasting from system keyboard easily
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>Y "*y
noremap <leader>P "*p

" leader w saves
nmap <leader>w :w!<cr>
" leader x closes the buffer 
nmap <leader>x :bd<cr>
" leader q exits 
nmap <leader>q :xa<cr>

" CR open/closes folds
nnoremap <CR> za

" Easy searching
" map <space> /
" map <c-space> ?

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" jk is escape
inoremap jk <esc>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" move to beginning/end of line is B/E not $/^
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

"Move a line of text using ALT+[jk] or Command+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"}}}
" FILE SPECIFIC CONFIGS{{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
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
autocmd BufWritePre,BufRead *.c,*.conf,*.cpp,*.css,*.erb,*.js,*.json,*.md,*.php,*.pp,*.py,*.rst,*.sh,*.sql :%s/\s\+$//e

filetype plugin on
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
nnoremap <silent> h :TmuxNavigateLeft<cr>
nnoremap <silent> j :TmuxNavigateDown<cr>
nnoremap <silent> k :TmuxNavigateUp<cr>
nnoremap <silent> l :TmuxNavigateRight<cr>
nnoremap <silent> w :TmuxNavigatePrevious<cr>
let g:tmux_navigator_save_on_switch = 1

"}}}
" MACROS & FUNCTIONS{{{
" Auto rebase move
let @r = 'gg/\n\nBww"8ywVd?a:pcwfjk, '

" convert rows of numbers or text (as if pasted from excel column) to a tuple
function! ToTupleFunction() range
    silent execute a:firstline . "," . a:lastline . "s/^/’/"
    silent execute a:firstline . "," . a:lastline . "s/$/’,/"
    silent execute a:firstline . "," . a:lastline . "join"
    silent execute "normal I("
    silent execute "normal $xa)"
endfunction

command! -range ToTuple <line1>,<line2> call ToTupleFunction()

"}}}
" PLUGINS{{{
" Easymotion{{{
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" move to word
map  <Leader>wo <Plug>(easymotion-bd-w)
nmap <Leader>wo <Plug>(easymotion-overwin-w)

"}}}
" Nerdtree{{{
map <C-n> :NERDTreeFocus<CR>
let NERDTreeIgnore=['^__pycache__$[[dir]]', '\.egg-info$[[dir]]']
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" Nerd tree opens when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"}}}
" ALE setup{{{
let g:ale_completion_enabled = 0
let g:ale_linters = {
    \ 'sh': ['language_server'],
    \ }
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %(code):% %s [%severity%]'

"}}}
"PGSQL SETUP{{{
let g:sql_type_default = 'pgsql'

"}}}
"GitGutter setup{{{
" set signcolumn=yes
let g:gitgutter_map_keys = 0

"}}}
" NoSwapSuck{{{
so ~/scripts/vim/noswapsuck.vim

"}}}
" CtrlP{{{
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'
let g:cpsm_query_inverting_delimiter = ' '
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_clear_cache_on_exit = 0

"}}}
" VirtualEnv{{{
let g:virtualenv_auto_activate = 1
"}}}
" Goyo{{{
let g:goyo_width = 200

"}}}
" powerline setup (just trying){{{
" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" let g:powerline_pycmd = "py3"
" let g:powerline_pyeval = "py3eval"
" set rtp+=$HOME/.local/lib/python3.6/site-packages/powerline/bindings/vim/
set showtabline=2
set noshowmode
"}}}
" Autoloading vim plugins{{{
 " if empty(glob('~/.vim/autoload/plug.vim'))
 "   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
 "     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 "   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
 " endif

"}}}
" Loading Plugins{{{
call plug#begin('~/.vim/plugged')
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'nixprime/cpsm'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'plytophogy/vim-virtualenv'
" Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'

" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }

Plug 'markonm/traces.vim'

Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
" Plug 'cespare/vim-toml'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'tmux-plugins/vim-tmux'

Plug 'easymotion/vim-easymotion'
Plug 'bkad/CamelCaseMotion'

" Plug 'junegunn/goyo.vim'
" Plug 'vimwiki/vimwiki'
call plug#end()
"}}}
"}}}
" vim:foldmethod=marker:foldlevel=0
