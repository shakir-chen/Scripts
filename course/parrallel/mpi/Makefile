CXX=mpic++
CXXFLAG=-std=c++11 	# C compiler flags
CXXPP=#-DDEBUG		# CXX Preprocessor
LDFLAGS= 			# Linker flags, e.g. -L<lib dir> if you have libraries in a nonstandard directory <lib dir>
LIBS= 				# Libraries to pass to the linker, e.g. -l<library>

A_TARGET=dijikstra_mpi
# $^: source file; $@: object file
A_FILES := $(wildcard *.cpp) $(wildcard *.c)
A_OBJS := $(sort $(patsubst %.c, %.o, $(patsubst %.cpp, %.o, $(A_FILES))))

all: $(A_TARGET)

# $(A_TARGET): %.o
$(A_TARGET): $(A_OBJS)
	$(CXX) $(CXXFLAG) $^ -o $@ $(LDFLAGS) $(LIBS)

%.o: %.cpp
	$(CXX) $(CXXFLAG) $(CXXPP) -c $< -o $@

# $<: source file; $@: object file
%: %.cpp
	$(CXX) $(CXXFLAG) $(CXXPP) -o $@ $<

run:
	# ./$(A_TARGET) ../input/input1.txt
	# mpiexec -n 1 ./$(A_TARGET) ../input/input1.txt
	# mpiexec -n 2 ./$(A_TARGET) ../input/input1.txt
	#
	mpiexec -n 10 ./$(A_TARGET) ../input/input2.txt

clean:
	rm $(A_TARGET) *.o output.txt

edit:
	vim mpi_dijkstra.cpp

test:
	bash time-rec.sh

input:
	cat ../input/input1.txt

check:
	# diff output.txt output.txt-right
	diff output2.txt output.txt
