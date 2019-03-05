" Obviously
set nocompatible

" VIEW SETTINGS
" Setting coloured column
colors zenburn
let &colorcolumn=111
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

set cursorline        " highlight current line
set cursorcolumn      " highlight current column
highlight CursorColumn ctermbg=darkgrey
set nowrap

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

" show line numbers
set number

" TAB SETTINGS
set tabstop=4 softtabstop=4 expandtab

" SEARCH SETTINGS
" Ignore case when searching
set ignorecase
set smartcase
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" KEYBOARD SHORTCUTS
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
" leader qw saves and quits
nmap <leader>qw :wq<cr>
" leader x exits 
nmap <leader>x :x<cr>

" Easy searching
map <space> /
map <c-space> ?

" jk is escape
inoremap jk <esc>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" FILE SPECIFIC CONFIGS
" filetype specific stuff
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

" VIM BACKUP
" backup to separate folder
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" TMUX PANE NAVIGATION
" tmux navigation with vim splits as well
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <M-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <M-w> :TmuxNavigatePrevious<cr>
let g:tmux_navigator_save_on_switch = 1

" MACROS
" Auto rebase move
let @r = '/\n\n€khww€@7"ayVd? a:€khp€kD€kD€kD€kDif'

" PLUGINS
" Easymotion
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

" nerdtree
map <C-n> :NERDTreeFocus<CR>
" let NERDTreeIgnore=['\__pycache__$[[dir]]', '\*.egg-info$[[dir]]']

set wildmode=list:longest,full   "make cmdline tab completion similar to bash
set wildmenu                     "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~      "stuff to ignore when tab completing

" ALE setup
let g:ale_completion_enabled = 1
let g:ale_linters = {
    \ 'sh': ['language_server'],
    \ }

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] (code): %s [%severity%]'

" TAG setup
nmap <F8> :TagbarToggle<CR>

" Calendar Setup
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" airline config
let g:airline#extensions#tabline#enabled = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Autoloading vim plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" powerline setup (just trying)
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Plugins here:
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'yegappan/mru'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'ivalkeen/nerdtree-execute'
Plug 'bkad/CamelCaseMotion'
Plug 'tmhedberg/SimpylFold'
Plug 'mhinz/vim-startify'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'

" Initialize plugin system
call plug#end()

