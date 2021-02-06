# source main bash functional configs
. ~/dotfiles/bash/core.sh # note . is the synonym to source

# source your personal configs below

# source aliases if defined
if [ -f ~/dotfiles/bash/aliases.sh ]; then
    . ~/dotfiles/bash/aliases.sh 
fi

