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
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" All of your Plugins must be added before the following line

" project/tree file viewer a-la any IDE
Plugin 'scrooloose/nerdtree'

" fuzzy finder; finds files, patterns in files, buffers, etc.
" install 'ag' or 'rg' to search files
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

" file finder (alternative to fzf+ag/rg)
" uses ack
Plugin 'dyng/ctrlsf.vim'
Plugin 'mileszs/ack.vim'

" git wrapper
Plugin 'tpope/vim-fugitive'

" status line, with colors and powerline fonts
Plugin 'vim-airline/vim-airline'

" left side +/-/etc git line gutter
Plugin 'airblade/vim-gitgutter'

" multiple line select cursor support
Plugin 'terryma/vim-multiple-cursors'

" better terminal mappings; not critical but offers ESC and :vterm
Plugin 'vimlab/split-term.vim'

" coffeescript syntax highlighting (and more); some projects still use it
Plugin 'kchmck/vim-coffee-script'

" color schemes
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'arcticicestudio/nord-vim'

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
nmap     <C-o>f :Ag<CR>
vmap     <C-o>w <Plug>CtrlSFVwordPath

" My custom commands (executed by :<command> mode)
" Don't end them with <CR> lol
command  Jf     %!python3 -m json.tool
command  Js     %!python3 -m json.tool --sort-keys


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


nmap  //   vip:s/^/\/\/ /<CR>  " insert c++ indent
vmap  //   :s/^/\/\/ /<CR>
nmap  r//  vip:s/^\/\/ //<CR>  " remove c++ indent
vmap  r//  :s/^\/\/ //<CR>
nmap  ##   vip:s/^/# /<CR>     " insert bash indent
vmap  ##   :s/^/# /<CR>
nmap  r##  vip:s/^# //<CR>     " remove bash indent
vmap  r##  :s/^# //<CR>

colorscheme nord

