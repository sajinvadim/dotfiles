execute pathogen#infect()
"Use Vim setting not vi
set nocompatible

"Show line numbers
set number
"set list

"Hightlight current line
set cul

"Enable 256 colors
set t_Co=256
"Enable syntax hinghlighing
syntax enable
colorscheme badwolf

"Indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"Enable mouse
set mouse=a

"Line numbering {{{
function! LineNumbersTogg()
    if(&relativenumber == 1)
        set relativenumber!
    else
        set relativenumber
    endif
endfunction

nnoremap <C-L> :call LineNumbersTogg()<CR>
"}}}

"Faster scrolling {{{
nnoremap <C-E> 3<C-E>
nnoremap <C-Y> 3<C-Y>
"}}}

"Tab navigation {{{
function! TabLine()
    let s =''
    for i in range(tabpagenr('$'))
        let tab = i + 1
        let winnr = tabpagewinnr(tab)
        let buflist = tabpagebuflist(tab)
        let bufnr = buflist[winnr - 1]
        let bufname = bufname(bufnr)
        let bufmdf = getbufvar(bufnr, "%mod")

        let s .= '%' . tab . 'T'
        let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        let s .= ' ' . tab . ':'
        let s .= (bufname != '' ? '[' . fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

        if bufmdf
            let s.= '[+] '
        endif
    endfor
    
    let s .= '%#TabLineFill#'
    return s
endfunction

set tabline=%!TabLine()

map  <S-w> :tabnext<CR>
imap <S-w> <C-O>:tabnext<CR>

map  <S-q> :tabprev<CR>
imap <S-q> <C-O>:tabprev<CR>
"}}}


"Max out the height of the current split
"Ctrl + w _

"Max out the width of the current split
"Ctrl + w |

"Normalize all splits
"Ctrl + w =


"Swap top/botton or left/right split
"Ctrl + W R

"Break out current window into a new tabview
"Ctrl + W T

"Close every window in the current tabview but the current one
"Ctrl + W o

"Open new split panes to right and bottom
set splitbelow
set splitright

"Autosave/load foldings {{{
"au BufWinLeave * mkview
"au BufWinEnter * loadview
"}}}

"Vundle {{{
filetype off
"Vundle path
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'Raimondi/delimitMate'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'tpope/vim-fugitive'
"Plugin 'edkolev/tmuxline.vim'
call vundle#end()

filetype plugin indent on
"}}}

"YouCompleteMe {{{
"https://github.com/Valloric/YouCompleteMe
"
"Restart - if completion stops
":YcmRestartServer
"
"Recompile file
":YcmForceCompileAndDiagnostics
"
"GoToDefinition
":YcmCompleter GoToDefinition
"
"GoToDeclaration
":YcmCompleter GoToDeclaration
"
"ClearCache
":YcmCompleter ClearCache
"

"'TurnsOff' only Identifier completer
"Semantic checking remains active
"let g:ycm_min_num_of_chars_for_completion = 99

"TurnsOff Completer & Sematic Checker
""let g:ycm_auto_trigger = 0

"Blacklist - skips checking following type of files
let g:ycm_filetype_blacklist = {'notes' : 1, 'text' : 1, 'log' : 1}

"Warning symbol
let g:ycm_warning_symbol = '>'

"Error symbol
let g:ycm_error_symbol = '✘'

"AutoCompletion in comments
let g:ycm_complete_in_comments = 1

"Output logs of YouCompleteMe
"let g:ycm_server_use_vim_stdout = 1

"Disable Preview menu
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

"Autoclose top Preview menu
"let g:ycm_autoclose_preview_window_after_completion = 1
"or
"let g:ycm_autoclose_preview_window_after_insertion = 1

"Global Path to .ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '/home/tweaks/dev/c/.ycm_extra_conf.py'

"Confirmation of extra_conf file
let g:ycm_confirm_extra_conf = 0

"Bindings
"Autocomplete keymap <Ctrl+Space>
"let g:ycm_key_invoke_completion = '<C-Space>'

"Show detailed info about diagnostic(err/warn)
"Calls YcmShowDetailedDiagnostic
"let g:ycm_key_detailed_diagnostics = '<C-i>'

"TODO - map GoToDefinition and GoToDeclaration
"map <F12>   :YcmCompleter GoToDefinition
"map <C-F12> :YcmCompleter GoToDeclaration
"}}}

"NERDTree {{{
"execute pathogen#infect()

"Open NERDTree when vim starts up
"autocmd vimenter * NERDTree

"Open NERDTree when vim starts up if no files were specified
autocmd STdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Toggle NERDTree with <Ctrl+b>
map <C-B> :NERDTreeToggle<CR>
"}}}

"DelimMate {{{
"Read documentation from ~/.vim/bundle/delimitMate/doc/delimitMate.txt
"}}}

"TagBar {{{
"Read documentation from ~/.vim/bundle/tagbar/doc/tagbar.txt

"Toggle TagBar with <Ctrl+o>
map <C-O> :TagbarToggle<CR>
"}}}

"Airline {{{
"Read documentation from ~/.vim/bundle/vim-airline/doc/airline.txt
"Status line always on
set laststatus=2

"Default theme
let g:airline_theme = 'badwolf'

"Enable fugitive Integration
let g:airline#extensions#branch#enabled = 1

"Enable tagbar
let g:airline#extensions#tagbar#enabled = 1
"}}}

"Enable tmuxline
let g:airline#extensions#tmuxline#enabled = 1

"Smarter tabline


"Disable pause aster exiting Insert mode
set ttimeoutlen=50
"Fugitive {{{

"}}}


"Rainbow Parantheses{{{
au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbodParenthesesLoadRound "()
"au Syntax * RainbodParenthesesLoadSquare "[]
"au Syntax * RainbodParenthesesLoadBraces "{}
"au Syntax * RainbodParenthesesLoadChevrons "<>


"}}}
