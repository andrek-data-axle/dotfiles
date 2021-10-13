" map the leader before using it in plugin key combos
let mapleader=","

" *****************************************************************************
" BEGIN PLUG STUFF
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'easymotion/vim-easymotion'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rhubarb'
Plug 'chrisbra/histwin.vim'
Plug 'Yggdroot/indentLine'
Plug 'elixir-lang/vim-elixir'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/closetag.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'dense-analysis/ale'

call plug#end()
" END PLUG STUFF

" BEGIN PLUGIN DESCRIPTIONS
" *****************************************************************************
" vim-gitgutter
" keymap for moving in hunks
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" handle grep alias (for color auto)
let g:gitgutter_escape_grep = 1
" *****************************************************************************
" NERDTree

function! NERDTreeToggleFind()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction

" open current file with Ctrl-e
map <C-e> :call NERDTreeToggleFind()<CR>

" close vim if the only open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" when opening a file, close NERDTree
let NERDTreeQuitOnOpen = 1
" *****************************************************************************
" vim-buffergator
" browse through buffers with NERDTree like interface
nnoremap <C-b> :BuffergatorToggle<CR>
" *****************************************************************************
" fzf.vim
"
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :Rg 
nnoremap <Leader>g :BCommits<CR>
let g:fzf_commits_log_options = '--color=always --format="%C(red)%h %C(auto)%s %C(green)(%cr) %C(bold blue)<%an>"'
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
inoremap <expr> <c-x><c-l> fzf#vim#complete#line({'window': { 'width': 1.0, 'height': 0.3 }})

" *****************************************************************************
" splitjoin
" gS to split a one line if statement into multiline
" gJ it join a multiline if statement into one line
" *****************************************************************************
" vim-easymotion
" *****************************************************************************
" vim-airline
" use powerline font
let g:airline_powerline_fonts = 1
" only show the swanky mode indicator
set noshowmode
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Skip the version control bit (I do this with zsh / bash)
let g:airline_section_b = ''
" Skip the file information because it uses too many characters
let g:airline_section_x = ''
let g:airline_section_y = ''
" Don't draw all these things I just disabled
let g:airline_skip_empty_sections = 1
" *****************************************************************************
" vim-unimpaired
" *****************************************************************************
" histwin
" *****************************************************************************
" use leader u to open history browser
nnoremap <leader>u :Histwin<CR>
" *****************************************************************************
" indent guides
" *****************************************************************************
" guide character
let g:indentLine_char = '.'
let g:indentLine_color_term = 239
" *****************************************************************************
" vim-gutentags
" *****************************************************************************
" majutsushi/tagbar
nmap <C-t> :TagbarToggle<CR>
" *****************************************************************************
" ale
" *****************************************************************************
let g:airline#extensions#ale#enabled = 1
nmap <silent> <A-k> <Plug>(ale_previous_wrap)
nmap <silent> <A-j> <Plug>(ale_next_wrap)
highlight ALEWarning ctermbg=Black
" *****************************************************************************
" vim-easy-align
" *****************************************************************************
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" *****************************************************************************
" END PLUGIN DESCRIPTIONS

" load filetype-specific indent files
filetype indent on

" With a map leader it's possible to do extra key combinations
let mapleader=","
" one second timeout for leader+key combos
set timeout timeoutlen=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" number lines
set number

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Show last command in bottom right corner
set showcmd

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" clear search highlighting
nnoremap <leader>c :nohlsearch<CR>

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
"
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set background=dark

" Don't hide characters in LaTeX
let g:tex_fast= ""

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Show a highlighted color bar at 100 characters
set colorcolumn=100
hi ColorColumn ctermbg=darkgrey guibg=darkgrey
set textwidth=100
" Or 150 in a ruby file
autocmd BufRead,BufNewFile *.rb set colorcolumn=150
autocmd BufRead,BufNewFile *.rb set textwidth=150
" and 72 in a gitcommmit
autocmd FileType gitcommit set colorcolumn=72
autocmd FileType gitcommit set textwidth=72

" Show trailing whitespaces
set list listchars=tab:»\ ,trail:•,extends:›,precedes:‹,nbsp:•

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=~/.vim/backup,/tmp
set directory=~/.vim/backup,/tmp
set undodir=~/.vim/backup,/tmp

" turn on persistent undo
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load filetype-specific indent files
filetype indent on

" Use spaces instead of tabs
set expandtab
" Except in JS
au BufRead,BufNewFile *js set noexpandtab
" And C
au BufRead,BufNewFile *.c,*h set noexpandtab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
" except in py and c/cpp
au BufRead,BufNewFile *.py,*pyw,*h,*c,*cpp set shiftwidth=4 tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space with ,,w
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
map <leader><leader>w :call DeleteTrailingWS()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

autocmd FileType gitcommit setlocal spell
autocmd BufRead,BufNewFile *.md  setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" preload the p yank buffer with binding.pry line
map <leader><leader>p Obinding.pry if true<esc>
map <leader>pdb Oimport pdb; pdb.set_trace()<esc>j

map <leader>nonp /\(\p\\|$\)\@!.<esc>
if !has('nvim')
  set clipboard=unnamed
else
  set clipboard+=unnamedplus
endif

" Edit crontab files on OSX
autocmd filetype crontab setlocal nobackup nowritebackup

" Uppercase SQL keywords. See https://groups.google.com/d/msg/vim_use/k-evBSOrNQM/PRZaLxsT1ksJ
map <leader>sql :%s/\<\w\+\>/\=synIDattr(synID(line('.'),col('.'),1), 'name')=~'sql\%(keyword\|operator\|statement\)'?toupper(submatch(0)):submatch(0)/g

" Incremental command feedback
set inccommand=nosplit
