#include <stdio.h>

extern "C" int findfval(double, double*);


int main()
{
	double a = 0;
	double b = 0;
	double h = 0;
	double e = 0;
	double t = 0;

	printf("\tCalculate convergation: interval - [a, b], step - h, accuracy - e\n");	
	printf("Enter a: ");
	scanf("%lf", &a);
	printf("Enter b: ");
	scanf("%lf", &b);
	printf("Enter h: ");
	scanf("%lf", &h);
	printf("Enter e: ");
	scanf("%lf", &e);	

	for(double x = a; x <= b; x += h)
	{
		double fval;
		findfval(x, &fval);
		printf("| x: %lf\t| F: %lf\t| fval: %lf\t|\n", x, fval, 0.0);
	
	}	

	return 0;
} 
