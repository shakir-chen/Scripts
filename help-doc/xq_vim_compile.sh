#make distclean
./configure --with-features=huge \                                                 --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope 
	    #--prefix=/home/xuanqi/Linux/
            #--with-python-config-dir=/home/xuanqi/Linux/lib/python2.7/config/ \
#make
#make install
