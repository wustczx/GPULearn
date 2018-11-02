#include<iostream>
#include"../common/base.h"

__global__ void add(int a, int b, int* c)
{
	*c = a+b;
}

int main()
{
	int c;
	int *dev_c;
	HANDLE_ERROR( cudaMalloc( (void**)&dev_c, sizeof(int)));
	add<<<1,1>>>(1, 2, dev_c);
	HANDLE_ERROR( cudaMemcpy(&c, dev_c, sizeof(int), cudaMemcpyDeviceToHost));
	std::cout<<"1+2="<<c<<std::endl;
	cudaFree(dev_c);
	return 0;
}
