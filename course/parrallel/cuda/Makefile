#FILE=matrix.cu
#FILE=demo2.cu
#FILE=vectorAdd.cu
#FILE=deviceVariable.cu
FILE=cuda_dijkstra_skeleton.cu

#TARGET="cuda_"$(basename $(FILE))

TARGET=$(basename $(FILE))
# https://github.com/NVIDIA/nccl/issues/29
# CXXFLAG=-D_MWAITXINTRIN_H_INCLUDED -D_FORCE_INLINES -D__STRICT_ANSI__
CXXFLAG=-D_MWAITXINTRIN_H_INCLUDED

#https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html

all:
	#echo $(TARGET)
	# nvcc -std=c++11 -arch=sm_52 -o $(TARGET) $(FILE)
	# nvcc $(CXXFLAG) -std=c++11 -arch=sm_52 -o $(TARGET) $(FILE)
	nvcc $(CXXFLAG) -std=c++11 -arch=compute_52 -o $(TARGET) $(FILE)

run:
	#./$(TARGET)  -n 2 -i ../input/input1.txt
	#./$(TARGET)  -n 2 -i ../input/input2.txt
	# ./$(TARGET)  -n 1024 -i ../input/input2.txt
	./$(TARGET)  -n 1024 -i ../input/input1.txt

diff:
	#vimdiff output.txt ../output/output2.txt
	sh outdiff.sh

clean:
	rm $(TARGET)
	rm output*.txt

edit:
	vim $(FILE)
