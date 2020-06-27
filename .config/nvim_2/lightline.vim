""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Lightline " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Get default from :h lightline

let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ }

let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'hunks', 'fugitive' ],
            \           [ 'readonly', 'modified'],
            \           [ 'bufferline' ],
            \           [ ] ],
            \ 'right': [ [ 'linter_errors', 'linter_warnings', 'percent', 'line' ],
            \            [ 'filetype' ], ]
            \ }

let g:lightline.inactive = {
            \ 'left': [ [ 'mode', 'paste'],
            \           [ 'readonly', 'filename', 'modified' ] ],
            \ 'right': [ [ 'percent', 'line' ],
            \            [ 'filetype' ], ]
            \ }

let g:lightline.tabline = {
            \ 'left': [ [ 'tabs' ],  ],
            \ 'right': [ [ 'close' ], ],
            \}

let g:lightline.tab = {
            \ 'active': [ 'tabnum', 'filename', 'modified' ],
            \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
            \}

let g:lightline.component = {
            \ 'mode': '%{lightline#mode()}',
            \ 'absolutepath': '%F',
            \ 'relativepath': '%f',
            \ 'filename': '%t',
            \ 'modified': '%M',
            \ 'bufnum': '%n',
            \ 'paste': '%{&paste?"PASTE":""}',
            \ 'readonly': '%R',
            \ 'charvalue': '%b',
            \ 'charvaluehex': '%B',
            \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
            \ 'fileformat': '%{&ff}',
            \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
            \ 'percent': '%3p%% ',
            \ 'percentwin': '%P',
            \ 'spell': '%{&spell?&spelllang:""}',
            \ 'lineinfo': '%l/%L  : %-2v',
            \ 'line': '%l  : %-2v',
            \ 'column': '%c',
            \ 'close': '%999X X ',
            \ 'winnr': '%{winnr()}',
            \ 'sep1': '',
            \ 'sep2': '.',
            \ 'bufferline': '%{bufferline#refresh_status()}%{g:bufferline_status_info.before}%#PreProc#%{g:bufferline_status_info.current}%#LightLineLeft_active_3#%{g:bufferline_status_info.after}'
            \}

let g:lightline.component_function = {
            \ 'readonly': 'StatuslineReadonly',
            \ 'fugitive': 'StatuslineFugitive',
            \ 'hunks': 'StatuslineSignify',
            \ 'filetype': 'MyFiletype',
            \}

let g:lightline.component_expand = {
            \ 'linter_checking': 'lightline#ale#checking',
            \ 'linter_infos': 'lightline#ale#infos',
            \ 'linter_warnings': 'lightline#ale#warnings',
            \ 'linter_errors': 'lightline#ale#errors',
            \ 'linter_ok': 'lightline#ale#ok',
            \ }

let g:lightline.component_type = {
            \ 'readonly': 'error',
            \ 'linter_checking': 'right',
            \ 'linter_infos': 'right',
            \ 'linter_warnings': 'warning',
            \ 'linter_errors': 'error',
            \ 'linter_ok': 'right',
            \ }

let g:lightline.mode_map = {
            \ 'n' : 'N',
            \ 'i' : 'I',
            \ 'R' : 'R',
            \ 'v' : 'V',
            \ 'V' : 'L',
            \ "\<C-v>": 'B',
            \ 'c' : 'C',
            \ 's' : 'S',
            \ 'S' : 'S-LINE',
            \ "\<C-s>": 'S-BLOCK',
            \ 't': 'T',
            \ }


let g:lightline.separator = {
            \   'left': '', 'right': ''
            \}
let g:lightline.subseparator = {
            \   'left': '', 'right': '|'
            \}

let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator

let g:lightline.enable = {
            \ 'statusline': 1,
            \ 'tabline': 1
            \ }

let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " END " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
