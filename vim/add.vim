" * ADDITIONAL CONFIGURATIONS

" clipboard setting, check that vim --version has +clipboard
" set clipboard=unnamedplus
set clipboard^=unnamed
" noremap <Leader>y "*y
" noremap <Leader>p "*p
" noremap <Leader>Y "+y
" noremap <Leader>P "+p

" http://learnvimscriptthehardway.stevelosh.com/chapters/10.html
inoremap jk <esc>l

" for vimgrep to ignore build directory and compiled files
set wildignore+=build/**
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" cuda file support
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda

" line numbers on
set number

set colorcolumn=81
highlight ColorColumn ctermbg=0

" Add a bit extra margin to the left
set foldcolumn=1

" Line number highlighting
highlight LineNr ctermfg=0
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" back/forward 1 buffer
nnoremap <leader>= :bp<CR>
nnoremap <leader>- :bn<CR>
" Configs lifted from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

"Always show current position
set ruler

" Height of the command bar
" set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" => Colors and Fonts
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" => Text, tab and indent related
" Use spaces instead of tabs (set et)
set expandtab

" Be smart when using tabs
set smarttab
"
" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry
set switchbuf+=usetab,newtab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Return to last edit position when opening files (keep this)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" => Status line
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Remap VIM 0 to first non-blank character
map 0 ^

" Toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" => Misc
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" fast editing and reloading of vimrc configs
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

" show global marks
nnoremap <silent> ,mu :call ShowGlobalMarks()<CR>

" get marks with vim-gitgutter faster
set updatetime=100

" directory for swap files, note ^ to prepend, see :help directory
set directory^=$HOME/.vim/swap

" => persistent undo
try
    set undofile
    set undodir=$HOME/.vim/undo
catch
endtry

set undolevels=10000
set undoreload=10000


" => Shell section
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif
