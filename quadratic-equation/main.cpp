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

	findroots(a, b, c, &rootfirst, &rootsecond);

	return 0;
} 
