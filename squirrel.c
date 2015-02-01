#include <stdio.h>
#include <stdarg.h>
#include <string.h>

#include "squirrel.h"
#include "sqstdio.h"
#include "sqstdaux.h"

#include "gilbert.h"

void printfunc(HSQUIRRELVM v, const SQChar *s, ...) 
{ 
	va_list arglist;
	va_start(arglist, s);
	scvprintf(s, arglist);
	va_end(arglist);
} 

void call_foo(HSQUIRRELVM v, int n, float f, const SQChar *s)
{
	int top = sq_gettop(v); //saves the stack size before the call
	sq_pushroottable(v); //pushes the global table
	sq_pushstring(v,"foo",-1);
	if (SQ_SUCCEEDED(sq_get(v,-2))) { //gets the field 'foo' from the global table
		sq_pushroottable(v); //push the 'this' (in this case is the global table)
		//sq_pushinteger(v,n); 
		//sq_pushfloat(v,f);
		//sq_pushstring(v,s,-1);
		sq_call(v,1,0,1); //calls the function 
	}
	sq_settop(v,top); //restores the original stack size
}

