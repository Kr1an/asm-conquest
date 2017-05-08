
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
extern "C" void arr_ops(char*, char*, char*, short*); // mutate four arrs, put res into the last one

char A[]={1,2,3,9,5,6,7,8}; // values range [-127..128]
char B[]={2,3,4,3,6,7,8,8}; // values range [-127..128]
char C[]={3,4,5,6,7,8,9,8}; // values range [-127..128]
short D[]={1,3,2,5,6,7,8,8}; // values range [-2^16+1..2^16]


using namespace std;

string arrshtostr(short*arr)
{
	string str = "";
	for(int i = 0; i < 8; i ++){
		str.append(patch::to_string(arr[i]));
		str.append(" ");
	}
	return str;
}
string arrchtostr(char*arr){
	string str = "";
	for(int i = 0; i < 8; i++){
		str.append(patch::to_string((short)arr[i]));
		str.append(" ");
	}
	return str;
}

string command = "python3 gui.py";


int main()
{
	string A_str = arrchtostr(A);
	string B_str = arrchtostr(B);
	string C_str = arrchtostr(C);
	string D_str = arrshtostr(D);

	char* a = A;
	char* b = B;

	char* c = C;
	short* d = D;

	arr_ops(a, b, c, d);

	cout << endl;
	
	for(int i=0; i < 8; i++)
		cout << " | " << d[i];
	cout << endl << endl;

	string F_str = arrshtostr(d);
	
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

