CXX=g++
CXXFLAG= -std=c++11 -fopenmp# C compiler flags
CXXPP= #-DPRED -DDEBUG		#-DPRED # CXX Preprocessor
LDFLAGS= 					# Linker flags, e.g. -L<lib dir> if you have libraries in a nonstandard directory <lib dir>
LIBS= 						# Libraries to pass to the linker, e.g. -l<library>

A_TARGET=openmp_dijkstra
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
	# ./$(A_TARGET) -n 3 -i ~/Research/input/input1.txt
	# cat output.txt
	./$(A_TARGET) -n 5 -i ~/Research/input/input2.txt

clean:
	rm $(A_TARGET) *.o output.txt *.txt

edit:
	vim $(A_TARGET).cpp

test:
	bash time-rec.sh

input:
	cat ../input/input1.txt
	# less ../input/input2.txt

check:
	# cat output.txt
	#vimdiff output.txt output-pred.txt
	diff output.txt version/output2.txt
	# rm o-head.txt
	# head -1 output.txt  >> o-head.txt
	# diff o-head.txt  version/o-head1.txt
