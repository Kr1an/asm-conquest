#include <stdio.h>

extern "C" {int findroots(double, double, double, double *, double *);}

int main()
{
	double a = 0;
	double b = 0;
	double c = 0;
	double rootfirst = 0;
	double rootsecond = 0;
	int condition = 0;
	

	condition = findroots(a, b, c, &rootfirst, &rootsecond);
	printf("\tEquation Calculation\n");
	if(condition == 0)
		printf("No real roots in equation\n");
	if(condition == 1)
		printf("First root: %f\nSecond root: %f\n", rootfirst, rootsecond);
	if(condition == 2)
		printf("Root: %f\n", rootfirst);
	

	return 0;
} 
