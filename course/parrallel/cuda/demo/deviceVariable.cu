#include <stdio.h>
#include <stdlib.h>

__device__ int d_value;

__global__ void test_Kernel()
{
	int threadID = threadIdx.x;

	d_value = 1;
	printf("gridDim %-3d, blockDim %-3d, blockIdx %-3d,threadID %-3d d_value%3d\n",gridDim.x,blockDim.x,blockIdx.x,threadID,d_value);
}
int main()
{
	int h_value = 0;

    dim3 blocks(8);         //gridDim = 8,blocksIdx,0-7
    dim3 threads(4);        //blockDim=4, threadIdx,0-3

    printf("Test blocks and threads ==============\n");

	test_Kernel<<<blocks,threads>>>();

    printf("use numbers ==============\n");

	//test_Kernel<<<8,4>>>();

	cudaMemcpyFromSymbol(&h_value,d_value,
		sizeof(int),0,cudaMemcpyDeviceToHost);
	
	printf("Output from host: %d\n",h_value);
	return 0;
}

