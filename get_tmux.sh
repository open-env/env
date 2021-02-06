
# Specify target directories
# create dirs if nonexistent
INSTALL_DIR=$HOME/local_tmux
echo "Installation directory:" $INSTALL_DIR
SRC_DIR=$INSTALL_DIR/sources
echo "Sources directory:" $INSTALL_DIR
mkdir -p $INSTALL_DIR $SRC_DIR
cd $SRC_DIR

# Download dependencies
LATEST_LIBEVENT=libevent-2.1.12-stable
wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/${LATEST_LIBEVENT}.tar.gz

NCURSES=ncurses-6.2
wget http://ftp.gnu.org/gnu/ncurses/${NCURSES}.tar.gz
# alternative:
# https://invisible-island.net/datafiles/release/ncurses.tar.gz

TMUX=3.1b
wget https://github.com/tmux/tmux/releases/download/${TMUX}/tmux-${TMUX}.tar.gz
# Install
tar -xvzf ${LATEST_LIBEVENT}.tar.gz
cd $LATEST_LIBEVENT
# -O doesnt work! 
# wget -O libevent.tar.gz https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
# mkdir -p libevent
# tar -xvzf libevent.tar.gz -C libevent

# cd $(tar -xvzf libevent.tar.gz -C libevent | head -n1)

./configure --prefix=$INSTALL_DIR
make
make install

# for tmux and vim executables: --enable-static --disable-shared

cd ..

tar -xvzf ${NCURSES}.tar.gz
cd $NCURSES
# or for the latest version: cd ncurses-*/
./configure --prefix=${INSTALL_DIR} --with-shared --with-termlib --enable-pc-files --with-pkg-config-libdir=${INSTALL_DIR}/lib/pkgconfig
make && make install

cd ..

tar -xvzf tmux-${TMUX}.tar.gz
cd tmux-${TMUX}/
PKG_CONFIG_PATH=${INSTALL_DIR}/lib/pkgconfig ./configure --prefix=${INSTALL_DIR} --enable-static --disable-shared
make && make install

cd ..

