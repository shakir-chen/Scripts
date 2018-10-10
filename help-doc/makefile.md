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

### Build
```bash
# Rules (explicit rules vs. inference rules)
output_files : input_files          # dependency lines, when to be rebuilt; target : sources
    actions                         # shell lines
```

```bash
# Link
Link_Target (qemu-arm): Obj_List (*.o )
    CC obj_list -o obj_target

# Compile
Obj_Target (main.o): Source(*.cpp) Header_List(*.h)
    CC -c source -o obj_target

Obj_Target1, Obj_Target2 : Header_List(*.h)
```

Macros
```bash
# Macros
Macros = value

# Macro Modifier
$(name:.obj=.c)                        #  "from=to" macro modifer: replace "from" text in expansion of OBJS with the "to" text
$(name:modifer[,modifier ...])         # $(SCS,D) ;  D-directory, E-extension, F-filename

$(OBJS, W space +\n)                    # Wstr A B, repalce regex A to regex B
                                        # @(include file contents), M(member),N(non-member),LC(lower), S(substitute)
```

Inference Rules
```bash
%.obj : %.c
    $(CC) $(CFLAG) -c $(.SOURCE)        # $@ : left sides of :
                                        # $^ : right sides of :
                                        # $< : the $< is the first item in the dependencies list => %.c           # % means any *
                                        # $* : * match % text in target
```


Special Target
<https://www.gnu.org/software/make/manual/html_node/Special-Targets.html>

```bash
all
.PHONY          # phony(fake) tareget; pros: 1. avoid name conflict; 2. improve performance (all: prog1 prog2   .PHONY:all)
.SENCONDRY      # dependency files are treated as intermediate files, except they are automaticlly depleted     ; vs. .INTERMIDATE
```

Function
<https://www.gnu.org/software/make/manual/html_node/Wildcard-Function.html>

```bash
wildcard
$(wildcard pattern ..)          # $(wildcard *.c) get all c files

patsubst        # pattern substitute

$(patsubst %.c %.o, $(wildcard *.c))

CONFIG_SOFTMMU := $(if $(filter %-softmmu,$(TARGET_DIRS)),y)
```

Special
<https://stackoverflow.com/questions/24777289/what-is-in-makefile>
```bash
?=
?= indicates to set the KDIR variable only if it's not set/doesn't have a value.

KDIR ?= "foo"
KDIR ?= "bar"

test:
    echo $(KDIR)

print foo in the end
```
<http://www.opussoftware.com/tutorial/TutMakefile.htm>
<http://makepp.sourceforge.net/1.19/makepp_tutorial.html>


# cmake
mkdir glfw-build
cd glfw-build
cmake ../       # glfw-root-file


