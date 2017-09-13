#include <stdio.h>
#include <stdlib.h>

char **array;
int arraysize=0;
int arraycapacity=0;
int userinput;
int opstatus;

void fleshinput();

int promptmenu();
int show(char**, int);
int push(char**, int);
int insert(char**, int);
int deleteitem(char**, int);
int deleteall(char**, int);
int _push(char*);
int _insert(char*, int);
int _addmemory();
int _delete(int);
int _deleteall();

int main()
{
	userinput = promptmenu();
	while(true)
	{
		if(userinput == 1)
			opstatus = show(array, arraysize);
		else if(userinput == 2)
			opstatus = push(array, arraysize);
		else if(userinput == 3)
			opstatus = insert(array, arraysize);
		else if(userinput == 4)
			opstatus = deleteitem(array, arraysize);
		else if(userinput == 5)
			opstatus = deleteall(array, arraysize);
		else if(userinput == 6)
			break;

		userinput = promptmenu();			
	}
	_deleteall();
	free(array);
	return 0;
}
void fleshinput()
{
	char c;
	while((c=getchar()) != '\n' && c != EOF) {}
}
int push(char** array, int arraysize)
{
	fleshinput();
	char *str = (char*)malloc(sizeof(char)*255);
	printf("enter new item: ");
	scanf("%s", str);
	return _push(str);
}
int _push(char* newitem)
{
	_addmemory();
	array[arraysize] = newitem;
	arraysize += 1;
	return 1;
}
int insert(char** array, int arraysize)
{
	fleshinput();
	int position = 0;
	char *str = (char*)malloc(sizeof(char)*255);
	printf("enter new item: ");
	scanf("%s", str);
	
	fleshinput();
	printf("enter item position: ");
	scanf("%d", &position);
	return _insert(str, position);
}
int deleteitem(char** array, int arraysize)
{
	fleshinput();
	int position = 0;
	printf("enter position: ");
	scanf("%d", &position);
	return _delete(position);
}
int _delete(int position)
{
	if(position >= arraysize || position < 0)
		return -1;
	else
	{
		for(int i = position; i < arraysize -1; i++)
			array[i] = array[i+1];
		arraysize -= 1;
		return 0;
	}
}
int deleteall(char** array, int arraysize)
{
	fleshinput();
	return _deleteall();
}
int _deleteall()
{
	for(int i = 0; i < arraysize; i++)
		free(array[i]);
	arraysize = 0;
	return 0;
}
int _insert(char* newitem, int position)
{
	printf("%s - %d\n", newitem, position);
	_addmemory();
	if(position > arraysize || position < 0)
		return -1;
	else if(position == arraysize)
		_push(newitem);
	else
	{
		char *removeditem;
		for(int i = position; i < arraysize + 1; i++)
		{
			removeditem = array[i];
			array[i] = newitem;
			newitem = removeditem;
		}
		arraysize += 1;
	}
	return 1;
}

int _addmemory()
{
	if(arraysize >= arraycapacity)
	{
		char ** newarray = (char**)malloc((arraycapacity+1)*2*sizeof(char*));
		arraycapacity = (arraycapacity+1)*2;
		for(int i = 0; i < arraysize; i++)
		{
			newarray[i] = array[i];
		}
		free(array);
		array = newarray;
	}
}
int show(char** array, int arraysize)
{
	fleshinput();
	printf("<--proc show content-->\n");
	for(int i = 0; i < arraysize; i++)
	{
		printf("\t");
		printf("%s | \n", array[i]);
		
	}
	printf("back to menu...");
	(void)getchar();
	return 0;
}

int promptmenu()
{
	int userinput;
	printf("<--dynamic-array-manager-->\n");
	printf("  1 - show\n");
	printf("  2 - push\n");
	printf("  3 - insert\n");
	printf("  4 - delete\n");
	printf("  5 - delete all\n");
	printf("  6 - exit\n");
	printf("choose option 1-6...");
	scanf("%d", &userinput);
	return userinput;
}  
