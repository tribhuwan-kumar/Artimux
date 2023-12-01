:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set completeopt-=preview " For No Previews
set splitright
set termguicolors
set encoding=UTF-8
set clipboard=unnamedplus

:syntax on


call plug#begin()


Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/rstacruz/vim-closer' " For brackets autocompletion
Plug 'https://github.com/nvim-tree/nvim-tree.lua' " For file tree
Plug 'https://github.com/akinsho/toggleterm.nvim' " For Terminal
Plug 'https://github.com/ayu-theme/ayu-vim'  " For ayu_dark theme
Plug 'https://github.com/kaicataldo/material.vim' " material colorscheme 
Plug 'https://github.com/LunarVim/Neovim-from-scratch/tree/16-toggleterm' " For vim terminal    
Plug 'https://github.com/CRAG666/code_runner.nvim' " For code_runner

Plug 'michaelb/sniprun', { 'do': 'bash install.sh' } " Code Runner plugin
Plug 'ayu-theme/ayu-vim' " For colorscheme or other package manager
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }  "For Highlighting
Plug 'nvim-tree/nvim-web-devicons' "For Developer Icons
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
Plug 'sheerun/vim-polyglot'  " Plugin for syntax highlighting and language features
Plug 'lewis6991/gitsigns.nvim' " For git tracking

" these plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Auto-completion For Javascript
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed


call plug#end()

" Configure Code Runner
let g:sniprun_config = {
\   'default_runner': 'python3',
\   'python3': {
\       'command': 'python3',
\       'cmdline': 'python3 $file',
\   },
\}

" Keybindings
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-p> :vsplit \| term pwsh<CR>
vnoremap <C-c> "+y
noremap  <C-v> "+p
nnoremap <C-a> ggVG
nnoremap <C-z> u
nnoremap <C-S-z> r
nnoremap <C-x> dd
vnoremap <C-x> x

" insert mode Keybindings
inoremap <S-Left> <Esc>vh
inoremap <S-Right> <Esc>vl
inoremap <S-Up> <Esc>vk
inoremap <S-Down> <Esc>vj

" nnoremap <C-l> :wa \| vertical botright term ++kill=term<CR>
" nnoremap <C-o> :tabnew term://pwsh<CR>

nmap <F8> :TagbarToggle<CR>

" Use Alt + arrow up to move the code line up
nnoremap <M-Up> :m-2<CR>==
inoremap <M-Up> <Esc>:m-2<CR>==gi

" Use Alt + arrow down to move the code line down
nnoremap <M-Down> :m+<CR>==
inoremap <M-Down> <Esc>:m+<CR>==gi

:set completeopt-=preview " For No Previews
" :set g:python3_host_prog   " to avoid surprises

":colorscheme ayu        " Here you can change themes
" let ayucolor="light"  " For light version of theme
" let ayucolor="mirage" " For mirage version of theme
"let ayucolor="dark"   " For dark version of theme



let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" For git tracking
"set statusline+=%{get(b:,'gitsigns_status','')}

let b:gitsigns_status_dict = {
   \ 'Added': '✚',
   \ 'Changed': '✹',
   \ 'Removed': '✖',
   \ 'Renamed': '➜',
   \ 'Untracked': '★',
   \ 'Unstaged': '✗',
   \ 'Staged': '✓',
   \ }

let b:gitsigns_status = {
   \ 'head': '',
   \ 'branch': '',
   \ 'signs': b:gitsigns_status_dict,
   \ }

