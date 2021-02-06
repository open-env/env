FROM ubuntu:latest

ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update \
     && apt-get install -y \
         nmap \
         tmux \
         vim-athena \
         emacs \
         keychain \
         sudo \
         git \
         build-essential \
         cmake \
         gdb \
         gcc \
         g++ \
         pkg-config \
         clang-format \
         xclip \
#        autojump \
#        python \
         wget 

# Install fzf
RUN git clone https://github.com/junegunn/fzf.git /home/.fzf \
    # && (cd /home/.fzf && git checkout 0.11.1) \
    && cd /home/.fzf \
    && (yes | /home/.fzf/install)

# Clone and set up dotfiles
COPY . /root/dotfiles

# Create vim dirs
RUN mkdir ~/.vim/ && mkdir ~/.vim/swap/ && mkdir ~/.vim/undo/ && mkdir ~/.vim/sessions/
RUN ls -larth ~

RUN cd /root/dotfiles/ && ./container-symlink-setup.sh

# Get plugins and run installation scripts for the following components:
# tmux, tpm;
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
RUN tmux start-server && \
    tmux new-session -d && \
    sleep 1 && \
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh && \
    tmux kill-server
# vim, vundle;
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall
# RUN [ "/bin/bash", "-c", "vim -T dumb -n -i NONE -es -S <(echo -e 'silent! PluginInstall')" ]
# spacemacs.
RUN git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d && \
    cd ~/.emacs.d && git checkout develop

