execute pathogen#infect()
filetype plugin on  " Enables filetype knowledge and indent?
filetype indent on  " Loads filetype specific indentation
syntax on           " Enable syntax processing

set tabstop=4       " Number of visual spaces per tab
set softtabstop=4   " Sets the number of spaces a tab counts for in edit mode
set expandtab       " Sets tabs to be multiple spaces
set shiftwidth=4    " Sets the size of indentation to 4 spaces
set autoindent

set incsearch       " Enables searching per character entered
set hlsearch        " Enablets highlighting of searched terms

set number          " Adds line numbers
set cursorline      " Adds a cursor line

set noea            " Makes splits not automatically resize
set noequalalways

" Folds along indentation
set foldmethod=indent

" Makes window splitting more natural
set splitbelow
set splitright

" Always enable the statusline
set laststatus=2

set ruler

" Makes solarized work correctly
set t_Co=16
set background=dark
colorscheme solarized
let g:solarized_termcolors=16

call togglebg#map("<F5>")

nnoremap <space> za " Opens folds on space bar
" These allow for Ctrl + hjkl for movement through splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>

" Yanks from cursor to end of line. More consistent with C and D.
nnoremap Y y$

" Moving up and down doesn't line wrap if a line goes over one screen width.
nnoremap j gj
nnoremap k gk

:nnoremap <silent> <F7> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co  --exclude-standart']

"set statusline+=%#warningmsg#
"set statusline+=%{ALEGetStatusLine()}
let g:ale_sign_column_always = 1

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'

" Mappings for moving from error to error and displaying the current error in
" more detail.
nmap <silent> <C-Up> <Plug>(ale_previous_wrap)
nmap <silent> <C-Down> <Plug>(ale_next_wrap)

nmap <silent> <return> <Plug>(ale_detail)

""" Linter Specific Settings """
" let g:ale_linters = {'c': ['clang']}
let g:ale_c_clang_options = '-Wall -pedantic'
let g:ale_c_gcc_options = '-Wall'

let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_docstring_preview = 1

autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

let g:ycm_python_binary_path = '/usr/bin/python3'

" Show just the line and column number in section z
let g:airline_section_y = '%l:%v'
let g:airline_section_z = ''
let g:airline_section_error = '%{ALEGetStatusLine()}'
