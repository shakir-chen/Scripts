CXX=g++
CXXFLAG=-std=c++11 	# C compiler flags
CXXPP= -DPRED -DDEBUG		# CXX Preprocessor
LDFLAGS= 			# Linker flags, e.g. -L<lib dir> if you have libraries in a nonstandard directory <lib dir>
LIBS= 				# Libraries to pass to the linker, e.g. -l<library>

A_TARGET=dijikstra_s
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

clean:
	rm *.o

run:
	./$(A_TARGET) ../input/input2.txt
	# ./$(A_TARGET) ../input/input3.txt

edit:
	vim serial_dijkstra.cpp
