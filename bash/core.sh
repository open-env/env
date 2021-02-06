
# use vim as an editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Preserve the bash history.
# https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
export HISTCONTROL=ignoredups:erasedups:ignorespace  # avoid duplicates
HISTSIZE=100000 # 100k hist items is good
HISTFILESIZE=$HISTSIZE
shopt -s histappend  # append to history, don't overwrite it
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTTIMEFORMAT='%Y-%m-%d %H:%M.%S | ' # format for history

# set bash prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[01;36m\]\u@\h\[\033[00m\] : \[\033[01;32m\]\w\[\033[01;35m\]\$(parse_git_branch)\[\033[00m\] $ "



