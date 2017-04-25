
#include <stdlib.h>
#include <cstdlib>
#include <string>
#include <sstream>

namespace patch
{
    template < typename T > std::string to_string( const T& n )
    {
        std::ostringstream stm ;
        stm << n ;
        return stm.str() ;
    }
}
#include <iostream>

extern "C" void sum(short *,short *); // mutate first arg
extern "C" void mul(short *,short *); // mutate first arg


short A[]={1,-2,3,200,5,6,7,8}; // values range [-254..255]
short B[]={2,-3,4,200,6,7,8,8}; // values range [-254..255]
short C[]={3,4,5,6,7,8,9,8}; // values range [-254..255]
short D[]={1,3,2,5,6,7,8,8}; // values range [-2^16+1..2^16]


using namespace std;

string arrtostr(short*arr)
{
	string str = "";
	for(int i = 0; i < 8; i ++){
		str.append(patch::to_string(arr[i]));
		str.append(" ");
	}
	return str;
}

string command = "python3 gui.py";


int main()
{
	string A_str = arrtostr(A);
	string B_str = arrtostr(B);
	string C_str = arrtostr(C);
	string D_str = arrtostr(D);

	short* a = A;
	short* b = B;
	sum(a, b); // store result in *(int a)

	short* c = C;
	short* d = D;
	sum(c, d); // store result in *(int c)
	
	mul(a, c); // store result in *(int a)
	
	cout << endl;
	for(int i=0; i < 8; i++)
		cout << " | " << a[i];
	cout << endl << endl;

	string F_str = arrtostr(a);
	command.append(" --A ");
	command.append(A_str);
	command.append(" --B ");
	command.append(B_str);
	command.append(" --C ");
	command.append(C_str);
	command.append(" --D ");
	command.append(D_str);
	command.append(" --F ");
	command.append(F_str);
	command.append(" &");
	system(command.c_str());
	
	return 1;
}

