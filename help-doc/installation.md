Git
$ make configure
$ ./configure --prefix=/home/xuanqi/Linux/
$ make all doc
$ make install install=doc install-html

Solarized Terminal
$ git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
$ gnome-terminal-colors-solarized/install.sh
$ gnome-terminal 		:will show solarized

Python
2.7.11
$ ./configure --prefix=/home/xuanqi/Linux/		:create a Makefile
$ make
$ make install

get-pip.py
$ python get-pip.py		:version must compare

vim
$ git clone https://github.com/vim/vim.git
$ cd src
$ sh xq_vim_install.sh	: remember to modify the prefix
	detail:
	$ make distclean # if you build vim before and python lib
	$ make
	$ make install

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
kvim %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%system
ctags and ag(the_silver_searcher)

%Python
$ pip install pyflakes
$ pip install pylint
$ pip install pep8

%%related package install
cmake
$ ./configure --prefih

the_silver_make

libpcre first           :don't install libpcre2(pcre2), libpcre
$ ./configure --prefix=/home/xuanqi/Linux/
$ make
$ make install

still can't find problem for libpcre
setenv PCRE_LIBS /home/xuanqi/Linux/lib/libpcre
setenv PCRE_CFLAGS /home/xuanqi/Linux/include/pcre

liblzma
$ git clone https://github.com/vinzenz/liblzma.git

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MPICH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
./configure /home/xuanqi/Linux
make install
