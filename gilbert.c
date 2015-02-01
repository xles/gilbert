#include <stdio.h>
#include <stdarg.h>
#include <string.h>

#include "squirrel.h"
#include "sqstdio.h"
#include "sqstdaux.h"

#include "gilbert.h"

int main(int argc, char **argv)
{ 
	HSQUIRRELVM v; 
	v = sq_open(INITIAL_SQVM_STACK_SIZE); // creates a VM with initial stack size 1024 

	sqstd_seterrorhandlers(v);

	sq_setprintfunc(v, printfunc, NULL); //sets the print function

	sq_pushroottable(v); //push the root table(were the globals of the script will be stored)
	if (SQ_SUCCEEDED(sqstd_dofile(v, _SC("test.nut"), 0, 1))) { // also prints syntax errors if any 
		call_foo(v,1,2.5,_SC("teststring"));
	}

	sq_pop(v,1); //pops the root table
	sq_close(v); 

	return 0; 
} 
