setlocal wrap
setlocal linebreak
setlocal spell
noremap j gj
noremap k gk
noremap gy :Goyo<CR>

function CR()
    if searchpair('\\begin{itemize}', '', '\\end{itemize}', '')
        return "\r\\item "
    endif
    return "\r"
endfunction
inoremap <expr><buffer> <CR> CR()
