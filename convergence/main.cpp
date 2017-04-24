#include <stdio.h>

extern "C" void	findfval(double, double*);
extern "C" int	findsval(double, double, double,  double*);

int main()
{
	double a = 0;
	double b = 0;
	double h = 0;
	double e = 0;
	double t = 0;
	double fval = 0;
	double sval = 0;
	int seqmembcnt = 0;

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
		seqmembcnt = 0;
		fval = 0;
		sval = 0;
		findfval(x, &fval);
		seqmembcnt = findsval(x, fval, e, &sval);
		printf("| x: %lf\t| F: %lf\t| S: %lf\t| n: %d\t|\n", x, fval, sval, seqmembcnt);
	}	

	return 0;
} 
