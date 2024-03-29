set shiftwidth=4
set autoindent
set backup
set cindent
set hlsearch
set incsearch
set ignorecase smartcase
set showmatch
set number
syntax on
filetype plugin on
filetype indent on

"Write current file, if modified, and exit.
:map <F12> ZZ
:map <C-F12> :q!<CR>
:map <F3> :set nu!<CR>
:map <C-S-c> "+yy
:map <C-S-v> "+p
:unmap <C-v>
set pastetoggle=<F2>

:colorscheme rubza
":map <F8> :source ~/.vim/setcolors.vim<CR>:SetColors all<CR>

" clip to 80 characters per line
:map <F9> gwap

" Switching between windows
:map <TAB> <C-w>w<CR>
:map <S-TAB> <C-w><S-w><CR>

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set dictionary=~/.ispell_british,/usr/share/dict/words
set complete=.,w,k
set keywordprg=dict

:map <F5> :set spell!<CR>
" :setlocal spell spelllang=en_us


"" in ~/.vimrc or ~/.vimrc.after if you're using janus
" nnoremap <cr><cr> :call ReturnToNewLine()<cr>
"
" function ReturnToNewLine()
"     let previous_char = getline(".")[col(".")-2]
"     " if there's a space before our current position, get rid of it first
"     if previous_char == ' '
"       execute "normal! \<bs>\<esc>"
"     endif
"     execute "normal! i\<cr>\<esc>"
" endfunction


