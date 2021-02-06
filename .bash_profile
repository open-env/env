
# Run interactive only shell (non-login) since
# tmux runs login shell by default which doesnt source ~/.bashrc
# see https://unix.stackexchange.com/a/541352
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi
