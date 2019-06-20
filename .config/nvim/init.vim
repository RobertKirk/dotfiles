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

let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
"}}}
" VIEW SETTINGS{{{

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
" set background=light
colors solarized

highlight EndOfBuffer ctermfg=8
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

" show paranthesis match
" set showmatch

set norelativenumber
set number

" TAB SETTINGS
" set tabstop=4 softtabstop=4 expandtab

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
let mapleader=" "

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

" leader x closes the buffer
nmap <leader>x :bp<bar>sp<bar>bn<bar>bd<CR>
" leader q exits
nmap <leader>q :xa<cr>

" CR open/closes folds
nnoremap <CR> za

" jk is escape
inoremap jk <esc>

" Pressing ss will toggle and untoggle spell checking
map <Leader>s :setlocal spell!<cr>
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
" PLUGINS{{{
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
" Nerdtree{{{
map <C-n> :NERDTreeFind<CR>
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeIgnore=['^__pycache__$[[dir]]', '\.egg-info$[[dir]]']
let g:NERDTreeShowHidden=1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeNaturalSort=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
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
" CtrlP{{{
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'
let g:cpsm_query_inverting_delimiter = ' '
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_clear_cache_on_exit = 0

"}}}
" DevIcons{{{
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" Disable arrow icons at the left side of folders for NERDTree.
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
highlight! link NERDTreeFlags NERDTreeDir

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
" gutentags{{{
let g:gutentags_file_list_command = {
    \ 'markers': {
        \ '.git': 'git ls-files --ignored',
        \ },
    \ }

let g:gutentags_define_advanced_commands = 1

"}}}
" vimtex{{{
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtext_fold_enabled = 1

"}}}
" nnn.vim{{{
" Disable default mappings
let g:nnn#set_default_mappings = 0

" Start nnn in the current file's directory
nnoremap <leader>n :NnnPicker '%:p:h'<CR>

let g:nnn#layout = { 'left': '~20%' }

let g:nnn#action = {
        \ '<c-t>': 'tab split',
        \ '<c-i>': 'split',
        \ '<c-s>': 'vsplit' }


let g:nnn#replace_netrw = 1
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
" Finding Files
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nixprime/cpsm'
Plug 'wsdjeg/FlyGrep.vim'
Plug 'jremmen/vim-ripgrep'

" Linting/completion/syntax
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'neomutt/neomutt.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'

" navigation
Plug 'mcchrish/nnn.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-vinegar'
Plug 'majutsushi/tagbar'

" motions/objects/actions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'wellle/targets.vim'
Plug 'easymotion/vim-easymotion'
Plug 'bkad/CamelCaseMotion'
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
" deoplete, has to come after pluin is loaded{{{
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('camel_case', v:true)
call deoplete#custom#option('max_list', 20)
call deoplete#custom#option('sources', {
\ 'python': ['around', 'file', 'member', 'jedi', 'tag'],
\})
"}}}
" vim:foldmethod=marker:foldlevel=0
