# Makefile

## Multiple Makefiles in One Folder
```
make -f makefile.win
make -f makefile.nix
```

## include header files from GCC search path
gcc -c -I/home/me/development/skia sample.c
<https://stackoverflow.com/questions/973146/how-to-include-header-files-in-gcc-search-path>

## Special Macros
CC=gcc
CFLAGS=-I.
DEPS = hellomake.h

%.o: %.c $(DEPS)
    $(CC) -c -o $@ $< $(CFLAGS)

hellomake: hellomake.o hellofunc.o
    gcc -o hellomake hellomake.o hellofunc.o -I.

This addition first creates the macro DEPS, which is the set of .h files on which the .c files depend. Then we define a rule that applies to all files ending in the .o suffix. The rule says that the .o file depends upon the .c version of the file and the .h files included in the DEPS macro. The rule then says that to generate the .o file, make needs to compile the .c file using the compiler defined in the CC macro. The -c flag says to generate the object file, the -o $@ says to put the output of the compilation in the file named on the left side of the :, the $< is the first item in the dependencies list, and the CFLAGS macro is defined as above.  As a final simplification, let's use the special macros $@ and $^, which are the left and right sides of the :, respectively, to make the overall compilation rule more general. In the example below, all of the include files should be listed as part of the macro DEPS, and all of the object files should be listed as part of the macro OBJ.>>

$@ : left sides of :
$^ : right sides of :
$< : the $< is the first item in the dependencies list => %.c           # % means any *

<http://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/>

## Built in target name
.SECONDARY : treated as intermeidate files
<https://www.gnu.org/software/make/manual/html_node/Special-Targets.html>
#objdump

```
objdump -d *.o  #to see the binary file of *.o
```


