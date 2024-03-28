# Install tmux 3.0a on Centos

# install deps
sudo yum install -y gcc kernel-devel make ncurses-devel

# DOWNLOAD SOURCES FOR LIBEVENT AND MAKE AND INSTALL
curl -LOk https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz
tar -xf libevent-2.1.11-stable.tar.gz
cd libevent-2.1.11-stable
./configure --prefix=/usr/local
make
sudo make install

# DOWNLOAD SOURCES FOR TMUX AND MAKE AND INSTALL

curl -LOk https://github.com/tmux/tmux/releases/download/3.0a/tmux-3.0a.tar.gz
tar -xf tmux-3.0a.tar.gz
cd tmux-3.0a
LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local
make
sudo make install

# pkill tmux
# close your terminal window (flushes cached tmux executable)
# open new shell and check tmux version
tmux -V
