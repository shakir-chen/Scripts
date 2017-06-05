OpenCV Learning Note
=====================


# Installation
## opencv 2.4
sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

<http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html>

## opencv 3.2
```
cd ~/<my_working_directory>
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.g
cd ~/opencv
mkdir build
cd build

make -j7 # runs 7 jobs in parallel
cd ~/opencv/build/doc/

# HELP DOC========================
make -j7 html_docs
sudo make install

# TEST========================
git clone https://github.com/opencv/opencv_extra.git
# set OPENCV_TEST_DATA_PATH environment variable to <path to opencv_extra/testdata>.
<cmake_build_dir>/bin/opencv_test_core
```

<http://www.pyimagesearch.com/2016/10/24/ubuntu-16-04-how-to-install-opencv/>
<http://docs.opencv.org/trunk/d7/d9f/tutorial_linux_install.html>



## Errors
1. imshow and startWindowThread()
```
/io/opencv/modules/highgui/src/window.cpp:583: error: (-2) The function is not implemented. Rebuild the library with Windows, GTK+ 2.x or Carbon support. If you are on Ubuntu or Debian, install libgtk2.0-dev and pkg-config, then re-run cmake or configure script in function cvShowImage
```
Guess : should build opencv from the source

2. /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh: No such file or directory
delete
<https://superuser.com/questions/893448/bash-shell-error-no-such-file-or-directory>

3. cv2.imshow not work
sudo apt-get install gtk2.0-dev (before installation, sudo apt-get install libpng-dev first)
