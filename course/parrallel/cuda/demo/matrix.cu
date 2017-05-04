#include <iostream>
#include <cstdio>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <cmath>
using namespace std;

const int TILE_WIDTH = 16;
__global__ void MatrixMulKernel(int *d_M,int *d_N,int *d_P,int m,int n,int k)
{
  __shared__ int ds_M[TILE_WIDTH][TILE_WIDTH];
  __shared__ int ds_N[TILE_WIDTH][TILE_WIDTH];

  int bx = blockIdx.x;
  int by = blockIdx.y;

  int tx = threadIdx.x;
  int ty = threadIdx.y;

  //Identify the row and column of the Pd element to work on
  int row = by * TILE_WIDTH + ty;
  int col = bx * TILE_WIDTH + tx;

  int pValue = 0;

  //loop over the Md and Nd tiles required to comput the Pd element
  for(int t = 0; t < (n-1) / TILE_WIDTH + 1; ++t)
  {
	if(row < m && t * TILE_WIDTH + tx < n)
	  ds_M[ty][tx] = d_M[row * n + t * TILE_WIDTH + tx];
	else
	  ds_M[ty][tx] = 0;

	if(col < k && t * TILE_WIDTH + ty < n)
	  ds_N[ty][tx] = d_N[(t * TILE_WIDTH + ty) * k + col];
	else
	  ds_N[ty][tx] = 0;
	__syncthreads();

	for(int i = 0; i < TILE_WIDTH; ++i)
	  pValue += ds_M[ty][i] * ds_N[i][tx];
	__syncthreads();
  }
  if(row < m && col < k)
	d_P[row * k + col] = pValue;
}

int main()
{
  //freopen("out","w",stdout);
  int m = 600, n = 700, k = 1000;
  int *h_M, *h_N, *d_M, *d_N;
  int *h_P, *d_P;
  size_t sizeM = m * n * sizeof(int);
  size_t sizeN = n * k * sizeof(int);
  size_t sizeP = m * k * sizeof(int);

  h_M = (int *) malloc(sizeM);
  h_N = (int *) malloc(sizeN);
  h_P = (int *) malloc(sizeP);

  cudaMalloc(&d_M,sizeM);
  cudaMalloc(&d_N,sizeN);
  cudaMalloc(&d_P,sizeP);

  for(int i = 0; i < m * n; ++i)
  {
	if(i % 2 == 0)
	  h_M[i] = 1;
	else
	  h_M[i] = 0;
  }

  for(int i = 0;i < n * k; ++i)
  {
	if(i % 2 == 0)
	  h_N[i] = 0;
	else
	  h_N[i] = 1;
  }

  cudaMemcpy(d_M,h_M,sizeM,cudaMemcpyHostToDevice);
  cudaMemcpy(d_N,h_N,sizeN,cudaMemcpyHostToDevice);

  cudaEvent_t start,stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start,0);

  dim3 grid((int)ceil(k*1.0 / TILE_WIDTH), (int)ceil(m*1.0/ TILE_WIDTH));
  dim3 block(TILE_WIDTH,TILE_WIDTH);
  MatrixMulKernel<<<grid,block>>>(d_M,d_N,d_P,m,n,k);

  cudaEventRecord(stop,0);
  //cudaDeviceSynchronize();
  cudaEventSynchronize(stop);
  float ElapsedTime;
  cudaEventElapsedTime(&ElapsedTime,start,stop);
  printf("Kernel Elpased Time: %.3f ms\n",ElapsedTime);

  cudaMemcpy(h_P,d_P,sizeP,cudaMemcpyDeviceToHost);
/*  
for(int i = 0; i < m * k; ++i)
	printf("%d\n",h_P[i]);
  printf("\n");
*/
  return 0;
}
