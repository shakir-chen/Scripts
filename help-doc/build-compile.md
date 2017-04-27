Build and Compile
===

# cmake

## configure var
cmake -LAH
<http://stackoverflow.com/questions/9298278/cmake-print-out-all-accessible-variables-in-a-script>
## Standard Process

1. Create CMakeLists.txt file
    ```
    cmake_minimum_required(VERSION 2.8)
    project( DisplayImage )
    find_package( OpenCV REQUIRED )
    add_executable( DisplayImage DisplayImage.cpp )
    target_link_libraries( DisplayImage ${OpenCV_LIBS} )
    ```

2. build Makefile
    ```
    cmake .
    ```

3. standard make
    ```
    make
    ```


# automake
pkg-config


# Make
tcpdump

