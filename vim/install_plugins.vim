set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()           " required
" * 1. PLUGIN LIST
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'pbogut/fzf-mru.vim'
" experimental
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'Valloric/ListToggle'
Plugin 'andymass/vim-matchup'
Plugin 'tpope/vim-repeat'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-surround'
Plugin 'amix/open_file_under_cursor.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'plasticboy/vim-markdown'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'HenryNewcomer/vim-theme-papaya'
Plugin 'alepez/vim-gtest'
Plugin 'mhinz/vim-startify'
" Plugin 'miki725/vim-ripgrep'
Plugin 'stefandtw/quickfix-reflector.vim'
" Plugin 'fatih/vim-go'
" Plugin 'valloric/youcompleteme'
" Plugin 'rdnetto/YCM-Generator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" To test a command use: 
" nnoremap ;g :echo 'First command'<CR>
