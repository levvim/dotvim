" Levi Mangarin vimrc
" via pathogen, using packages crtlp syntastic airline vim-r nerdtree fugitive
"
set nocompatible
filetype off

execute pathogen#infect()
set relativenumber
filetype plugin indent on

"enable colorway
syntax on
syntax enable
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

set cursorline      "highlight current line
set backspace=2     "backspace over everything in insert mode

set tabstop=4       "number of visual spaces per TAB
set softtabstop=4   "number of spaces in tab when editing
set expandtab       "tabs are spaces

set cursorline      "highlight current line
filetype indent on  "load filetype-specific indent files
set wildmenu        "visual autocomplete for command menu

set incsearch       "search as characters are entered
set hlsearch        "highlight matches

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"package settings

"crtlp settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'

"syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{fugitive#statusline()} " add fugitive line functionality

""powerline settings (currently using airline instead of powerline)
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"""Always show statusline
"set laststatus=2
""" Use 256 colours (Use this setting only if your terminal supports 256 colours
"set t_Co=256
""" let g:Powerline_symbols = "fancy"

"airline settings
set laststatus=2
let g:airline_theme='sol'
set t_Co=256
" buffers via airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"vim-r-plugin
"maplocalleader = "\\"
let vimrplugin_assign = 0
"NEOVIM NVIM BINDINGS
"send vis selection block using r
vmap <Space> <Plug>RDSendSelection

"nerdtree
map <C-n> :NERDTreeToggle<CR>
map <Leader>p :NERDTreeToggle<CR>

"fugitive git bindings
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gp :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :Dispatch! git push<CR>
nnoremap <Leader>gpl :Dispatch! git pull<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keybindings

"move vertically by visual line
nnoremap j gj
nnoremap k gk

"call cli without shift
nnoremap ; :

"$/^ doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>

"jj is escape in insert mode
inoremap jj <ESC>

""fast window split resizing (by scaled percentage)
"nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
"nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>[ :exe "resize " . (winwidth(0) * 2/3)<CR>
"nnoremap <silent> <Leader>] :exe "resize " . (winwidth(0) * 3/2)<CR>

"fast window split resizing (by fixed amount)
nnoremap <silent> <Leader>- :resize -20<CR>
nnoremap <silent> <Leader>= :resize +20<CR>
nnoremap <silent> <Leader>[ :vertical resize -15<CR>
nnoremap <silent> <Leader>] :vertical resize +15<CR>
nnoremap <C-P> :Vexplore<CR>

"netrw fast open
"nnoremap <Leader>p :Vexplore<CR>
nnoremap <Leader>o :Sexplore<CR>

"fast window split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

"fast tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
"nnoremap tn  :tabnext<Space>
nnoremap tn :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
"alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>

"fast insert comment lines with @s macro
let @s = "O################################################################################jj"










































