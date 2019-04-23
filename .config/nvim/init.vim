" Robert Kirk
" GENERIC SETTINGS{{{
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
scriptencoding utf-8
set hidden
set encoding=UTF-8
set modelines=1
set autoread
set updatetime=100
set noshowmode

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3.6'
"}}}
" VIEW SETTINGS{{{
syntax enable
set background=dark
colors solarized

highlight EndOfBuffer ctermfg=8
set cursorcolumn      " highlight current column
highlight CursorColumn ctermbg=8
set nowrap

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

" Always show statusline
set laststatus=2

" No Tab Line
set showtabline=0

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

nnoremap <leader>g :lgrep<Space>
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
"}}}
" POST lOAD fIXED{{{
function! CorrectColorScheme()
  highlight EndOfBuffer ctermfg=8
endfunction

autocmd VimEnter * call CorrectColorScheme()
"}}}
" KEYBOARD SHORTCUTS{{{
let mapleader=","

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
nmap <leader>x :w!<cr>:bd<cr>
" leader q exits
nmap <leader>q :xa<cr>

" CR open/closes folds
nnoremap <CR> za

" Easy searching
map <space> /

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
map <C-n> :NERDTreeFind<CR>
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['^__pycache__$[[dir]]', '\.egg-info$[[dir]]']
let NERDTreeShowHidden=1
let NERDTreeNaturalSort=1

let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeStatusline = '%#NonText#'

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
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %(code):% %s [%severity%]'

nnoremap <silent> <C-f> <Plug>(ale-format)

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"}}}
""Coc SETUP{{{
"" Smaller updatetime for CursorHold & CursorHoldI
"set updatetime=300

"function! s:show_documentation()
"  if &filetype == 'vim' || &filetype == 'help'
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

"" Use K for show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
""}}}
""YouCompleteMe SETUP{{{
let g:ycm_filetype_specific_completion_to_disable = {
    \ 'json': 1
    \}

nnoremap <silent> gd :YcmCompleter GoTo<CR>
"}}}
"GitGutter setup{{{
set signcolumn=yes
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
" airline{{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_highlighting_cache = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='solarized'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

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
let g:virtualenv_directory = '/home/robert/smarkets'

"}}}
" DevIcons{{{
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" Disable arrow icons at the left side of folders for NERDTree.
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
highlight! link NERDTreeFlags NERDTreeDir

"}}}
" Goyo{{{
let g:goyo_width = 200

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
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nixprime/cpsm'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'plytophogy/vim-virtualenv'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'

Plug 'sheerun/vim-polyglot'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'markonm/traces.vim'

Plug 'jremmen/vim-ripgrep'

Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'

Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'

Plug 'easymotion/vim-easymotion'
Plug 'bkad/CamelCaseMotion'

Plug 'vim-airline/vim-airline/'
Plug 'vim-airline/vim-airline-themes/'

Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
call plug#end()
"}}}
" vim:foldmethod=marker:foldlevel=0
