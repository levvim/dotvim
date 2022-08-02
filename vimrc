" Levi Mangarin 2019 
" .vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basics
set encoding=utf-8
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
" Keybindings

"jj is escape in insert mode
inoremap jj <ESC>

"call cli without shift
nnoremap ; :

"move vertically by visual line
nnoremap j gj
nnoremap k gk

"fast window split resizing (by fixed amount)
nnoremap <silent> <Leader>- :resize -10<CR>
nnoremap <silent> <Leader>= :resize +10<CR>
nnoremap <silent> <Leader>[ :vertical resize -10<CR>
nnoremap <silent> <Leader>] :vertical resize +10<CR>
nnoremap <C-P> :Vexplore<CR>

"fast window split navigation
let g:BASH_Ctrl_j = 'off'
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

""fast window reconfiguring
nnoremap <Leader><C-h> <C-w>H
nnoremap <Leader><C-j> <C-w>J
nnoremap <Leader><C-k> <C-w>K
nnoremap <Leader><C-l> <C-w>L

"fast scrolling with leader
nnoremap gj <C-d>
nnoremap gk <C-u>
nnoremap <g-j> <C-d>
nnoremap <g-k> <C-u>

"fast tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

"fast insert comment lines with @s macro
nnoremap <silent><Leader>3 o################################################################################<Esc>kk<CR>

"fast insert blank lines
nnoremap <silent><Leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>

"toggle paste
set showmode
function! TogglePaste()
    if(&paste == 0)
        set paste
        echo "Paste Mode Enabled"
    else
        set nopaste
        echo "Paste Mode Disabled"
    endif
endfunction

nnoremap np :call TogglePaste()<cr>

" fast resizing (for small screens)
nnoremap nr <C-w>K<C-w><C-j>:resize 8<CR>:resize 8<CR><C-w><C-k>

"delete any trailing whitespace
let @a = ":%s/\s\+$//e"

" Enable folding with the spacebar
nnoremap <space> za

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Package settings

"airline settings
set laststatus=2
let g:airline_theme='solarized'
set t_Co=256
set noshowmode
" buffers via airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"vim-r-plugin
"maplocalleader = "\\"
map <SPACE> <localleader>
let vimrplugin_assign = 0
"NEOVIM NVIM BINDINGS
"send vis selection block using r
"vmap <Leader><Space> <Plug>RDSendSelection

"nerdtree
map <C-n> :NERDTreeToggle<CR>
nnoremap nm :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0

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

"vim-indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

"easymotion
" change easymotion fast ping to s
nmap s <Plug>(easymotion-overwin-f)
"map <SPACE> <Plug>(easymotion-s2)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 0

"Goyo
map <C-g> :Goyo<CR>

"ConqueGDB
nnoremap <silent> <Leader>rb  :ConqueTermVSplit bash<CR>
nnoremap <silent> <Leader>rp  :ConqueTermVSplit python<CR>

" Fast mode {{{
if !exists('g:ConqueTerm_FastMode')
    let g:ConqueTerm_FastMode = 0
endif " }}}
" automatically go into insert mode when entering buffer {{{
if !exists('g:ConqueTerm_InsertOnEnter')
    let g:ConqueTerm_InsertOnEnter = 0
endif " }}}
" Allow user to use <C-w> keys to switch window in insert mode. {{{
if !exists('g:ConqueTerm_CWInsert')
    let g:ConqueTerm_CWInsert = 0
endif " }}}
" Choose key mapping to leave insert mode {{{
if !exists('g:ConqueTerm_EscKey')
    let g:ConqueTerm_EscKey = 'jj'
endif " }}}
" Use this key to execute the current file in a split window. {{{
if !exists('g:ConqueTerm_ExecFileKey')
    let g:ConqueTerm_ExecFileKey = '<F11>'
endif " }}}
" Use this key to send the current file contents to conque. {{{
if !exists('g:ConqueTerm_SendFileKey')
    let g:ConqueTerm_SendFileKey = '<F10>'
endif " }}}
" Use this key to send selected text to conque. {{{
if !exists('g:ConqueTerm_SendVisKey')
    let g:ConqueTerm_SendVisKey = '<F9>'
endif " }}}
" Enable color. {{{
if !exists('g:ConqueTerm_Color')
    let g:ConqueTerm_Color = 1
endif " }}}
" Send key commands
if !exists('g:conque_repl_send_key')
    let g:conque_repl_send_key = '<F5>'
endif
if !exists('g:conque_repl_send_buffer_key')
    let g:conque_repl_send_buffer_key = '<F6>'
endif
let s:locked = 0

"send selections via <Leader>a
nmap <Leader>a :call feedkeys("\<F5>")<CR>
vnoremap <Leader>a :ConqueTermSendSelection<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"setup for conqueterm send via <F5> and <Leader>a
" Based on 'conque_term#send_selected'
fun! s:send_text(mode, all) 
  if s:locked
    return
  endif
  let s:locked = 1
  " Conque sets the 'updatetime' option to 50 in order to use the 
  " CursorHold hack to poll for program output and update the terminal
  " buffer.
  " The value of update_time is saved, since switching buffers with
  " the 'sb' command doesn't trigger the events conqueshell needs to restore
  " updatetime to its sane value, and making changes to the file buffer would
  " cause a lot of swap writes(:h updatetime).
  let saved_updatetime = &updatetime
  " get current buffer name
  let buffer_name = expand('%')
  " get most recent/relevant terminal
  let term = conque_term#get_instance()
  " Test the current mode to paste correctly in the term
  if a:mode == 2
    " Visual mode, get lines selected and if needed, strip the start/end 
    " of the first/last lines respectively.
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let text = getline(lnum1, lnum2)
    let text[0] = text[0][col1-1 :]
    let text[-1] = text[-1][: col2-1]
  else
    if a:all
      let text = getline(1,'$')
    else
      let text = [getline('.')]
    endif
  endif
  call term.focus()
  for line in text
    call term.writeln(line)
  endfor
  " scroll buffer left
  startinsert!
  normal! 0zH
  " If the buffers were switched in the current call stack, the terminal
  " buffer would not be updated, and the eval results would not be visible. 
  call s:after_ui_refresh('s:switch_buffer', [buffer_name, a:mode, saved_updatetime])
endfun

fun! s:switch_buffer(buffer_name, mode, saved_updatetime) 
  augroup conque_repl_timeout
    autocmd!
  augroup END
  let &updatetime = a:saved_updatetime
  let save_sb = &switchbuf
  sil set switchbuf=usetab
  exe 'sb ' . a:buffer_name
  let &switchbuf = save_sb
  if a:mode > 0
    stopinsert " Stop insert if was in normal or visual mode
    if a:mode == 2
      " Reselect previous selected text
      " normal! gvl
    endif
  endif
  let s:locked = 0
endfun

fun! s:after_ui_refresh(F, args)
  let s:temp_function_name = a:F
  let s:temp_function_args = a:args
  augroup conque_repl_timeout
    autocmd!
    autocmd CursorHoldI * call call(s:temp_function_name, s:temp_function_args)
  augroup END
endfun

command! ConqueTermSendLineInsert :call s:send_text(0, 0)
command! ConqueTermSendLineNormal :call s:send_text(1, 0)
command! -range ConqueTermSendSelection :call s:send_text(2, 0) 
command! ConqueTermSendBufferInsert :call s:send_text(0, 1) 
command! ConqueTermSendBufferNormal :call s:send_text(1, 1) 

if g:conque_repl_send_key != '' && ! maparg(g:conque_repl_send_key)
  exe 'inoremap <silent>' g:conque_repl_send_key '<ESC>:ConqueTermSendLineInsert<CR>'
  exe 'nnoremap <silent>' g:conque_repl_send_key ':ConqueTermSendLineNormal<CR>'
  exe 'vnoremap <silent>' g:conque_repl_send_key ':ConqueTermSendSelection<CR>'
en

if g:conque_repl_send_buffer_key != '' && ! maparg(g:conque_repl_send_buffer_key)
  exe 'inoremap <silent>' g:conque_repl_send_buffer_key '<ESC>:ConqueTermSendBufferInsert<CR>'
  exe 'nnoremap <silent>' g:conque_repl_send_buffer_key ':ConqueTermSendBufferNormal<CR>'
en

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Unused keybinds

""fast window split resizing (by scaled percentage)
"nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
"nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>[ :exe "resize " . (winwidth(0) * 2/3)<CR>
"nnoremap <silent> <Leader>] :exe "resize " . (winwidth(0) * 3/2)<CR>

"netrw fast open
"nnoremap <Leader>p :Vexplore<CR>
"nnoremap <Leader>o :Sexplore<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unused packages

"crtlp settings
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_map = '<c-p>'

"syntastic settings
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"set statusline+=%{fugitive#statusline()} " add fugitive line functionality

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

