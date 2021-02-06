" CORE CONFIGS
set nocompatible              " be iMproved, required
filetype off                  " required

" vim environment
" tip:
"   gf on a filename to go to the mentioned file
"   C-6 (that is, ctrl + 6) to go back to a last visited buffer (this file)
source ~/dotfiles/vim/install_plugins.vim " should always be called first
source ~/dotfiles/vim/configure_plugins.vim " plugin-specific configs
source ~/dotfiles/vim/functions.vim " helpers
source ~/dotfiles/vim/filetypes.vim " file type specific configs
source ~/dotfiles/vim/add.vim " additional configs and commands

" Uncomment below to enable directory-based .vimrc which may be useful
" for project-based configurations
" set exrc
" Security notice:
" If you run 'vim random_code_from.github' and there is a .vimrc file in that 
" directory, the commands from .vimrc will be executed, which is not secure.
set secure

