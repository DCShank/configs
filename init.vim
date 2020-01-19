if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 " General improvements
 call dein#add('altercation/vim-colors-solarized')
 call dein#add('Konfekt/FastFold')
 " Allows unimpaired keymaps to be repeated with '.'
 call dein#add('tpope/vim-repeat')
 " More efficient paren matching!
 call dein#add('itchyny/vim-parenmatch')
 " Add typescript syntax highlighting
 call dein#add('leafgarland/typescript-vim')

 " Additional functionality and commands
 " Tmux and vim can navigate through each other using <C-h/j/k/l>
 call dein#add('christoomey/vim-tmux-navigator',
            \{'on_map': ['<C-h>','<C-j>','<C-k>','<C-l>']})
 call dein#add('bronson/vim-trailing-whitespace')
 call dein#add('justinmk/vim-dirvish')
 call dein#add('tpope/vim-unimpaired')
 silent! call repeat#set("\<Plug>unimpaired", v:count)
 call dein#add('tpope/vim-eunuch')
 " Adds some cool git stuff
 call dein#add('airblade/vim-gitgutter')

 call dein#add('vim-airline/vim-airline')
 call dein#add('vim-airline/vim-airline-themes')
 " Python plugins
 call dein#add('tmhedberg/SimpylFold',
            \{'on_ft': ['.py']})
 call dein#add('vim-scripts/python_match.vim',
            \{'on_ft': ['.py']})
 " More syntax highlightning for python
 "call dein#add('numirias/semshi',
 "           \{'on_ft': ['.py']})
 " Additional auto completion and other matching stuff for python.
 call dein#add('davidhalter/jedi-vim',
            \{'on_ft': ['.py']})

 " Autocomplete
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('zchee/deoplete-jedi',
              \{'on_ft': ['.py']})

 " Syntax and semantic linting
 call dein#add('w0rp/ale')

 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

" Install any plugins that are missing
if dein#check_install()
    call dein#install()
endif

filetype plugin on  " Enable filetype knowledge and indent?
filetype indent on  " Load filetype specific indentation
syntax on           " Enable syntax processing

" Makes solarized work correctly
set background=dark
colorscheme solarized
"set hl SignColumn bg=darkgrey
"highlight SignColumn ctermbg=darkred
"highlight GitGutterAdd ctermbg=white

call togglebg#map("<F5>")

set tabstop=4       " Set number of visual spaces per tab
set softtabstop=4   " Set the number of spaces a tab counts for in edit mode
set expandtab       " Set tabs to be multiple spaces
set shiftwidth=4    " Set the size of indentation to 4 spaces
set autoindent

set incsearch       " Enable searching per character entered
set hlsearch        " Enable highlighting of searched terms

set number          " Add line numbers
set cursorline      " Add a cursor line

set noea            " Make splits not automatically resize
set noequalalways

" Fold along indentation
set foldmethod=indent
" Make window splitting more natural
set splitbelow
set splitright

set laststatus=2    " Always enable the statusline
set ruler           " Enable the ruler

" Remappings
" Open folds on space
nnoremap <space> za
" Remap backspace to be % for easier paren matching in normal mode
nnoremap <BS> %
" Yanks from cursor to end of line. More consistent with C and D.
nnoremap Y y$
" Moving up and down doesn't line wrap if a line goes over one screen width.
nnoremap j gj
nnoremap k gk

" Also fix whitespace.
nnoremap <silent> <F7> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" inconvenient with [ and ]
let g:nremap = {"[e": "[s", "]e": "]s"}
let g:xremap = {"[e": "[s", "]e": "]s"}
let g:oremap = {"[e": "[s", "]e": "]s"}
" FastFold settings. This may need some updating.
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1
" Disables default paren matching so the more efficient plugin can run.
let g:loaded_matchparen = 1
nnoremap <silent> <F8> :FixWhitespace <CR>
" Show just the line and column number in section z
let g:airline_section_y = '%l:%v'
let g:airline_section_z = ''
" Disable auto complete 'import' after 'from [package]'
let g:jedi#smart_auto_mappings = 0
let g:deoplete#enable_at_startup = 1
" Ale stuff
"let g:ale_sign_column_always = 1
"let g:gitgutter_sign_column_always = 1
set signcolumn=yes

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'

let g:ale_linters = {
            \'c': ['gcc'],
            \}

let g:ale_c_gcc_options = "-std=c11 -Wall -fno-builtin -fasm -Wno-pointer-to-int-cast"

let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 'never'

" Mappings for moving from error to error and displaying the current error in
" more detail.
nmap <silent> <C-Up> <Plug>(ale_previous_wrap)
nmap <silent> <C-Down> <Plug>(ale_next_wrap)

nmap <silent> <return> <Plug>(ale_detail)

" Show just the line and column number in section z
let g:airline#extensions#ale#enabled = 1
" Enable switch autocomplete option with <Tab>, <S-Tab>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set updatetime=100

let mapleader=","
