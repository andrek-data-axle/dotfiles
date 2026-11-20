" === Core Vim Settings ===
syntax on
filetype plugin indent on
set number
set norelativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus

" === fzf Settings ===
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" === Colorscheme ===
if !empty(glob("~/.config/nvim/pack/plugins/start/walh"))
    colorscheme walh-nord
elseif !empty(glob("~/.config/nvim/pack/plugins/start/nord-vim"))
    colorscheme nord
elseif !empty(glob("~/.config/nvim/pack/plugins/start/palenight.vim"))
    colorscheme palenight
endif

" === Key Mappings ===
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :Ag<CR>
nnoremap <Leader>nn :NERDTreeToggle<CR>
" Enable native package loading
" Vim automatically loads everything in ~/.vim/pack/*/start
syntax on
filetype plugin indent on

" Optional: some fzf.vim defaults
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }




" ---------------------------------------------------------------------------------------
"
" I make notes in this file too, because it makes sense for me to 
" keep notes and mappings in the same place
"
" yank to system clipboard: "*5yy <- yank 5 lines
" paste from sys clipboard: "*p

" search+replace: mark files with <tab> in fzf buffer
" press <enter> to send them to the quickfix buffer
" then use this in qf buffer: :cfdo %s/<text to search>/<text to replace with>/g | update

" comment out stuff: // or ## in normal mode; uncomment with r// or r##
"
" IMPORTANT
" On Linux (debian, ubuntu), link this file like this:
" ln -s <this file> /home/andre/.config/nvim/init.vim
"
" ---------------------------------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
"
" let Vundle manage Vundle, required
"
" The following are examples of different formats supported.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Avoid a name conflict with L9
"

" project/tree file viewer a-la any IDE

" fuzzy finder; finds files, patterns in files, buffers, etc.
" install 'ag' or 'rg' to search files

" file finder (alternative to fzf+ag/rg)
" uses ack

" git wrapper

" status line, with colors and powerline fonts

" left side +/-/etc git line gutter

" multiple line select cursor support

" better terminal mappings; not critical but offers ESC and :vterm

" coffeescript syntax highlighting (and more); some projects still use it

" color schemes

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
"
" see :h vundle for more details or wiki for FAQ

" My custom maps (executed just by pressing command keys)
" ------------------------------------------------
map      <C-e>  :call NERDTreeActivate()<CR>
map      <C-o>l :NERDTreeFind<CR>
map      <C-o>j :%!python3 -m json.tool<CR>

function NERDTreeActivate()
  :NERDTreeFocus
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

map      <C-o>p :Files<CR>
map      <C-o>b :Buffers<CR>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nmap     <C-o>f :Ag<CR>
vmap     <C-o>w <Plug>CtrlSFVwordPath

" My custom commands (executed by :<command> mode)
" Don't end them with <CR> lol
command  Jf     %!python3 -m json.tool
command  Js     %!python3 -m json.tool --sort-keys
command  Rc     %!rubocop % -a
command  Cf     %!clang-format

" other ctrlsf maps I don't use 
" vmap     <C-F>F <Plug>CtrlSFVwordExec
" nmap     <C-F>n <Plug>CtrlSFCwordPath
" nmap     <C-F>p <Plug>CtrlSFPwordPath
" nnoremap <C-F>o :CtrlSFOpen<CR>
" nnoremap <C-F>t :CtrlSFToggle<CR>
" inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" My Sets
" -------
set splitright
set splitbelow
set mouse=a
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap

" Airline Configuration
" ---------------------
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.colnr = '⇿'

let g:ctrlsf_backend = 'ack'
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_ignore_dir = ['log', 'tmp']
let g:fzf_preview_window = ['right,50%', 'ctrl-/']

nmap  //   vip:s/^/\/\/ /<CR>  " insert c++ indent
vmap  //   :s/^/\/\/ /<CR>
nmap  r//  vip:s/^\/\/ //<CR>  " remove c++ indent
vmap  r//  :s/^\/\/ //<CR>
nmap  ##   vip:s/^/# /<CR>     " insert bash indent
vmap  ##   :s/^/# /<CR>
nmap  r##  vip:s/^# //<CR>     " remove bash indent
vmap  r##  :s/^# //<CR>

colorscheme walh-nord

" === CSV View Setup ===
" Initialize the plugin's core engine using a safe Lua call
if has('nvim')
    silent! lua require('csvview').setup()
endif

" Automatically activate the grid view when opening a CSV or TSV file
autocmd BufRead,BufNewFile *.csv,*.tsv CsvViewEnable

" Set up spreadsheet arrow navigation using pure Vim mappings
autocmd FileType csv,tsv nnoremap <buffer> <Tab> :lua require('csvview').jump_field(1)<CR>
autocmd FileType csv,tsv nnoremap <buffer> <S-Tab> :lua require('csvview').jump_field(-1)<CR>

