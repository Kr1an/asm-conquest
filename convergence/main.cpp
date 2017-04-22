#include <stdio.h>

extern "C" {int findconvergence(double, double, double, double);}

int main()
{
	double a = 0;
	double b = 0;
	double h = 0;
	double e = 0;

	printf("\tCalculate convergation: interval - [a, b], step - h, accuracy - e\n");	
	printf("Enter a: ");
	scanf("%lf", &a);
	printf("Enter b: ");
	scanf("%lf", &b);
	printf("Enter h: ");
	scanf("%lf", &h);
	printf("Enter e: ");
	scanf("%lf", &e);	
	
	findconvergence(a, b, h, e);	

	return 0;
} 
