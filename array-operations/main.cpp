#include <stdio.h>
#include <stdlib.h>

extern "C" void sum(short *,short *); // mutate first arg
extern "C" void mul(short *,short *); // mutate first arg


short A[]={1,-2,3,200,5,6,7,8}; // values range [-254..255]
short B[]={2,-3,4,200,6,7,8,8}; // values range [-254..255]
short C[]={3,4,5,6,7,8,9,8}; // values range [-254..255]
short D[]={1,3,2,5,6,7,8,8}; // values range [-2^16+1..2^16]



int main()
{
	short* a = A;
	short* b = B;
	sum(a, b); // store result in *(int a)

	short* c = C;
	short* d = D;
	sum(c, d); // store result in *(int c)
	
	mul(a, c); // store result in *(int a)
	
	printf("\n");
	for(int i=0; i < 8; i++)
		printf(" | %d", a[i]);
	printf("\n");
	system("echo 'hello, world'");

	return 1;
}
