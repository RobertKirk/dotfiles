" Robert Kirk
" GENERIC SETTINGS{{{
set nocompatible
set encoding=UTF-8
set modelines=1
"}}}
" VIEW SETTINGS{{{
colors default

set cursorcolumn      " highlight current column
highlight CursorColumn ctermbg=black
set nowrap

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

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
  " Annoying tilde should be hidden
  highlight EndOfBuffer ctermfg=16
  highlight VertSplit ctermbg=16 ctermfg=16
  highlight CursorColumn ctermbg=black
  python3 from powerline.vim import setup as powerline_setup
  python3 powerline_setup()
endfunction

autocmd VimEnter * call CorrectColorScheme()
"}}}
" KEYBOARD SHORTCUTS{{{
let mapleader=","

" leader <space> to turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Pasting from system keyboard easily
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "*y
noremap <Leader>P "*p

" leader w saves
nmap <leader>w :w!<cr>
" leader x exits 
nmap <leader>x :bd<cr>

" leader n toggles nerdtree
map <leader>n :NERDTreeToggle<CR>

" leader m toggles tagbar
map <leader>n :TagbarToggle<CR>

" CR open/closes folds
nnoremap <CR> za

" Easy searching
map <space> /
map <c-space> ?

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" jk is escape
inoremap jk <esc>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" incrementing
nnoremap + <C-a>
nnoremap - <C-x>

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
" MACROS{{{
" Auto rebase move
let @r = '/\n\n€khww€@7"ayVd? a:€khp€kD€kD€kD€kDif'

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
" let NERDTreeIgnore=['\__pycache__$[[dir]]', '\*.egg-info$[[dir]]']

"}}}
" ALE setup{{{
let g:ale_completion_enabled = 1
let g:ale_linters = {
    \ 'sh': ['language_server'],
    \ }
let g:ale_sign_column_always = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %(code):% %s [%severity%]'

"}}}
"PGSQL SETUP{{{
let g:sql_type_default = 'pgsql'

"}}}
"TAG setup{{{
nmap <F8> :TagbarToggle<CR>

"}}}
" NoSwapSuck{{{
so ~/repos/personal/scripts/noswapsuck.vim

"}}}
" powerline setup (just trying){{{
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
let g:powerline_pycmd = "py3"
let g:powerline_pyeval = "py3eval"
set rtp+=$HOME/.local/lib/python3.6/site-packages/powerline/bindings/vim/
"}}}
" Autoloading vim plugins{{{
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

"}}}
" Loading Plugins{{{
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeFocus' }
Plug 'ivalkeen/nerdtree-execute', { 'on':  'NERDTreeFocus' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeFocus' }
Plug 'tpope/vim-fugitive', { 'on':  'NERDTreeFocus' }
Plug 'ryanoasis/vim-devicons', { 'on':  'NERDTreeFocus' }

Plug 'vim-scripts/CycleColor', { 'on': 'CycleColorNext' }

Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Konfekt/FastFold'
Plug 'majutsushi/tagbar'
Plug 'tmhedberg/SimpylFold'

Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }

Plug 'yegappan/mru'
Plug 'junegunn/goyo.vim', { 'for': 'text, markdown' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'bkad/CamelCaseMotion'
Plug 'vimwiki/vimwiki'
call plug#end()
"}}}
"}}}
" vim:foldmethod=marker:foldlevel=0
