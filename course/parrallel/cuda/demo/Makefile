#FILE=matrix.cu
#FILE=demo2.cu
#FILE=vectorAdd.cu
FILE=deviceVariable.cu

TARGET="cuda_"$(basename $(FILE))
#https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html


all:
	#echo $(TARGET)
	nvcc -std=c++11 -arch=sm_52 -o $(TARGET) $(FILE)


run:
	./$(TARGET)


clean:
	rm $(TARGET)

edit:
	vim $(FILE)
