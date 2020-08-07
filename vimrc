" Settings {{{
syntax on
" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup
" No swap file
set noswapfile

" Command history
set history=100

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

set updatetime=300

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" The number of spaces in tab when editing
set softtabstop=4

"set autoindent

" Turn on line numbers
set number

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" Hide the toolbar
set guioptions-=T

" UTF encoding
set encoding=utf-8

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu
set wildmode=list:longest,list:full

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

set foldlevel=0

" Set built-in file system explorer to use layout similar to the NERDTree plugin
let g:netrw_liststyle=3

" Always highlight column 99 so it's easier to see where
" cutoff appears on longer screens
autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
set colorcolumn=99
" }}}

" Plugins {{{

call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'jmcantrell/vim-virtualenv'
" Plug 'ap/vim-css-color'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'fisadev/vim-isort'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/loremipsum'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Specific coc extensions
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/vim-jsx-improve', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

" Theme
let base16colorspace=256
set t_Co=256
set background=dark
colorscheme base16-eighties

" CtrlP
map <C-b> :CtrlPBuffer<cr>
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=30

" CtrlP -> override <C-o> to provide options for how to open files
let g:ctrlp_arg_map = 1

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,node_modules,

" CtrlP -> use Ag for searching instead of VimScript
" (might not work with ctrlp_show_hidden and ctrlp_custom_ignore)
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Airline (status line)
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline#extensions#branch#enabled = 0

" Git authorisation settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN

" Git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
set signcolumn=yes
highlight clear SignColumn

" Searching the file system
map <leader>f :NERDTreeToggle<cr>

" Camel Case Motion (for dealing with programming code)
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" vim-rust
let g:rust_fold = 1

" vim-virtualenv
let g:virtualenv_directory = '~/.local/share/virtualenvs/'

" coc
let g:coc_node_path = '/usr/bin/node'

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')

" highlight error in red
highlight CocErrorHighlight ctermbg=Red  ctermfg=White

" highlight error in red
highlight CocWarningHighlight ctermbg=White  ctermfg=Red

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" Isort
let g:vim_isort_python_version = 'python3'

" python-pep-8-indent
let g:python_pep8_indent_multiline_string = -1

" }}}

" Mappings {{{
" Notes...
"
" :map     j gg (j will be mapped to gg)
" :map     Q j  (Q will also be mapped to gg, because j will be expanded -> recursive mapping)
" :noremap W j  (W will be mapped to j not to gg, because j will not be expanded -> non recursive)
"
" These mappings work in all modes. To have mappings work in only specific
" modes then denote the mapping with the mode character.
"
" e.g.
" to map something in just NORMAL mode use :nmap or :nnoremap
" to map something in just VISUAL mode use :vmap or :vnoremap

" Clear search buffer
nnoremap <leader><space> :nohlsearch<CR>

" Command to use sudo when needed
cmap w!! %!sudo tee > /dev/null %

" File System Explorer (in horizontal split)
map <leader>. :Sexplore<cr>

" Buffers
map <leader>yt :ls<cr>

" Buffers (runs the delete buffer command on all open buffers)
map <leader>yd :bufdo bd<cr>

" Make handling vertical/linear Vim windows easier
map <leader>w- <C-W>- " decrement height
map <leader>w+ <C-W>+ " increment height
map <leader>w] <C-W>_ " maximize height
map <leader>w[ <C-W>= " equalize all windows

" Handling horizontal Vim windows doesn't appear to be possible.
" Attempting to map <C-W> < and > didn't work
" Same with mapping <C-W>|

" Make splitting Vim windows easier
map <leader>; <C-W>s
map <leader>` <C-W>v

" Tmux style window selection
map <Leader>ws :ChooseWin<cr>
" }}}

" Commands {{{
" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,cucumber,ruby,yaml,zsh,vim,javascript,css,html setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal textwidth=79

" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.spv set filetype=php
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()

" }}}

