// 
// Il est demand√©d'expliquer l'ensemble des instructions
// pr√c√d√es par un TODO: ?
//

#include<iostream>

__global__ void addKernel(int *c, const int *a, const int *b);

int main(int argc, char** argv)
{
	const int size = 5;
	// TODO: ?
	const int h_a[size] = { 1, 2, 3, 4, 5 };
	const int h_b[size] = { 10, 20, 30, 40, 50 };
	
	int h_c[size] = { 0 };
	
	// TODO: ?
	cudaSetDevice(0);
	
	// TODO: ?
	int *d_a = 0;
	int *d_b = 0;
	int *d_c = 0;
	
	// TODO: ?
	cudaMalloc((void**)&d_a, size * sizeof(int));
	cudaMalloc((void**)&d_b, size * sizeof(int));
	cudaMalloc((void**)&d_c, size * sizeof(int));
	
	// TODO: ?
	cudaMemcpy(d_a, h_a, size * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(d_b, h_b, size * sizeof(int), cudaMemcpyHostToDevice);
	
	// TODO: ?
	dim3 grdDim = dim3(1,1,1);
	dim3 blkDim = dim3(size,1,1);
	// TODO: ?
	addKernel <<<grdDim, blkDim >>>(d_c, d_a, d_b);
	
	// TODO: ?
	cudaDeviceSynchronize();
	
	// TODO: ?
	cudaMemcpy(h_c, d_c, size * sizeof(int), cudaMemcpyDeviceToHost);
	
	// TODO: ?
	cudaFree(d_a);
	cudaFree(d_b);
	cudaFree(d_c);
	
	// Impression des r√sultats
	std::cout << "{1,2,3,4,5} + {10,20,30,40,50} = {" << h_c[0] << "," << h_c[1] << "," << h_c[2] << "," << h_c[3] << "," << h_c[4] << "}" << std::endl;

	return 0;
}

// TODO: ?
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // TODO: ?
    int i = threadIdx.x;
    c[i] = a[i] + b[i];
}

