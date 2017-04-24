#include <stdio.h>

extern "C" void sum(int *,int *); // mutate first arg
extern "C" void mul(int *,int *); // mutate first arg


int A[]={1,-2,3,200,5,6,7,8}; // values range [-254..255]
int B[]={2,-3,4,200,6,7,8,8}; // values range [-254..255]
int C[]={3,4,5,6,7,8,9,8}; // values range [-254..255]
int D[]={1,3,2,5,6,7,8,8}; // values range [-2^16+1..2^16]



int main()
{
	int* a = A;
	int* b = B;
	sum(a, b); // store result in *(int a)

	int* c = C;
	int* d = D;
	sum(c, d); // store result in *(int c)
	
	mul(a, c); // store result in *(int a)
	
	printf("\n");
	for(int i=0; i < 8; i++)
		printf(" | %d", a[i]);
	printf("\n");

	return 1;
}
