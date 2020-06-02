" Plugins will be downloaded under the specified directory." 
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
" Theme "
Plug 'arcticicestudio/nord-vim'

" Plugins become visible to Vim after this call."
call plug#end()


" Basic Conf "
syntax on
set number
set cursorline
set tabstop=4
set shiftwidth=4
let g:airline_powerline_fonts=1


" Setting colorscheme "
if exists('+termguicolors')
	"let &t_8f = \<Esc>[38;2;%lu;%lu;%lum"
	"let &t_8b = \<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

" Nord Colorscheme "
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord
" Airline Config "
let g:airline_theme='nord'


" Nerdcommenter "
filetype plugin on
