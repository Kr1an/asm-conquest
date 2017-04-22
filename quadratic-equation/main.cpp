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
	printf("\tCalculate equation: a*x^2 + b*x + c = 0.\n");	
	printf("Enter a: ");
	scanf("%lf", &a);
	printf("Enter b: ");
	scanf("%lf", &b);
	printf("Enter c: ");
	scanf("%lf", &c);	
	condition = findroots(a, b, c, &rootfirst, &rootsecond);
	printf("\tEquation Calculation\n");
	if(condition == 0)
		printf("No real roots in equation\n");
	if(condition == 1)
		printf("First root: %.2lf\nSecond root: %.2lf\n", rootfirst, rootsecond);
	if(condition == 2)
		printf("Root: %.2lf\n", rootfirst);
	

	return 0;
} 
