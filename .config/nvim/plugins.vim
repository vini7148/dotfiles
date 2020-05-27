""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Plugins " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')
Plug 'shougo/deoplete.nvim'
Plug 'tpope/vim-commentary',            {'on': '<Plug>Commentary'}
Plug 'ctrlpvim/ctrlp.vim',              {'on': ['CtrlP', 'CtrlPMixed', 'CtrlPMRU']}
Plug 'lambdalisue/suda.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'w0rp/ale',                        { 'on': ['ALEEnable', 'ALEToggle'] }
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale',          { 'on': ['ALEEnable', 'ALEToggle'] }
Plug 'bling/vim-bufferline'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree',              { 'on': 'NERDTreeFind' }
Plug 'mhinz/vim-startify'
Plug 'rrethy/vim-hexokinase',           { 'do': 'make hexokinase', 'on': 'HexokinaseTurnOn' }
Plug 'mbbill/undotree',                 { 'on': 'UndotreeToggle' }
Plug 'mileszs/ack.vim',                 { 'on': 'Ack' }
Plug 'ryanoasis/vim-devicons'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Startify " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ascii = [
            \ '    ████     ██                           ██            ',
            \ '   ░██░██   ░██                          ░░             ',
            \ '   ░██░░██  ░██  █████   ██████  ██    ██ ██ ██████████ ',
            \ '   ░██ ░░██ ░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██',
            \ '   ░██  ░░██░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██',
            \ '   ░██   ░░████░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██',
            \ '   ░██    ░░███░░██████░░██████   ░░██   ░██ ███ ░██ ░██',
            \ '   ░░      ░░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░ ',
            \]

let g:startify_custom_header = g:ascii

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Commentary " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Deoplete " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:python3_host_prog = '/usr/bin/python3'
"let g:deoplete#enable_at_startup = 1
"" Enable deoplete when InsertEnter.
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
call deoplete#custom#source('ale', v:true)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Suda " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:suda_smart_edit = 1
" Write buffer through sudo
" Neovim: suda plugin
cnoreabbrev w!! w suda://%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Signify " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" default updatetime 4000ms is not good for async update
set updatetime=100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Hexokinase " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Hexokinase_highlighters = [ 'backgroundfull' ]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Highlighted Yank " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:highlightedyank_highlight_duration = 400

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Ack " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
nnoremap <Leader>ff :Ack<SPACE>
nnoremap <Leader>fc :Ack<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Undotree " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>u :UndotreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " ALE " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd InsertEnter * ALEEnable
let g:ale_enabled = 1
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
"let g:ale_open_list = 1
let g:ale_list_window_size = 3
"let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=0 ctermfg=magenta

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " CtrlP " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"nnoremap <Leader>po :CtrlPMRUFiles<CR>
nnoremap <silent> <Space>pp :CtrlP<CR>
nnoremap <silent> <Space>pm :CtrlPMixed<CR>
nnoremap <silent> <Space>pr :CtrlPMRU<CR>
let g:ctrlp_mruf_exclude = '.*/tmp/.*\|.*/.git/.*'
let g:ctrlp_max_files = 200000
let g:ctrlp_mruf_relative = 1
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore=vendor --ignore images --ignore svg --ignore fonts -g ""'
    let g:ctrlp_use_caching = 0
else
    let g:ctrlp_clear_cache_on_exit = 0
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Lightline " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.config/nvim/lightline.vim

""" Statusline Functions for Icon Support and External Plugins Support
source ~/.config/nvim/statusline_functions.vim

""" Lightline Buffer
""" hide buffer list
"let g:lightline_buffer_excludes = ['vimfiler', 'fish']
""" lightline-buffer function settings
"let g:lightline_buffer_show_bufnr = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Vim Bufferline " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_echo = 0
let g:bufferline_excludes = [ 'fish' ]
let g:bufferline_show_bufnr = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " NERDTree " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeChDirMode = 2
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.sqlite$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$','\.bak$', '\~$']
let NERDTreeShowBookmarks = 1
let NERDTree_tabs_focus_on_files=1
let NERDTreeMapOpenInTabSilent = '<RightMouse>'
let NERDTreeWinSize = 31
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
"" Function to toggle NERDTree in Current Working Directory
function! NERDTreeToggleInCurDir()
    "If NERDTree is open in the current buffer
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        exe ":NERDTreeClose"
    else
        if (expand("%:t") != '')
            exe ":NERDTreeFind"
        else
            exe ":NERDTreeToggle"
        endif
    endif
endfunction

nnoremap <M-e> :call NERDTreeToggleInCurDir()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Crystalline " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" source ~/.config/nvim/crystalline.vim

""" Generate Crystalline Theme
"source ~/.config/nvim/generate-crystalline-theme.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " GRUVBOX " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_contrast_dark = 'hard'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  " Airline " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Lazyload Airline(Activate on Insert Mode or Enable with Shortcut)
" autocmd CursorHold * AirlineRefresh
" map <leader>at :AirlineRefresh<CR>

" let g:airline_powerline_fonts = 1

""" Tabline Settings
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_splits = 0
"let g:airline#extensions#tabline#show_tabs = 1
" let g:airline#extensions#tabline#tab_nr_type = 1 " Show Tab Number
" let g:airline#extensions#tabline#show_tab_type = 0
"let g:airline#extensions#tabline#buf_label_first = 1
"let g:airline#extensions#tabline#buffers_label = 'b'
"let g:airline#extensions#tabline#tabs_label = 't'
" let airline#extensions#tabline#current_first = 1
"let g:airline#extensions#tabline#buffer_nr_show = 0
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline#extensions#tabline#show_close_button = 0

""" Statusline Settings
" let g:airline#extensions#hunks#non_zero_only = 1
" let g:airline_highlighting_cache = 1
" let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" let g:airline_section_y = '%3p%% '
" let g:airline_section_z = '%l  : %-2v'
" let g:airline_mode_map = {
"       \ '__'     : '-',
"       \ 'c'      : 'C',
"       \ 'i'      : 'I',
"       \ 'ic'     : 'I',
"       \ 'ix'     : 'I',
"       \ 'n'      : 'N',
"       \ 'multi'  : 'M',
"       \ 'ni'     : 'N',
"       \ 'no'     : 'N',
"       \ 'R'      : 'R',
"       \ 'Rv'     : 'R',
"       \ 's'      : 'S',
"       \ 'S'      : 'S',
"       \ ''     : 'S',
"       \ 't'      : 'T',
"       \ 'v'      : 'V',
"       \ 'V'      : 'V',
"       \ ''     : 'V',
"       \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " END " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
