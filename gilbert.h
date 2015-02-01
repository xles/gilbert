#ifndef GILBERT_H
#define GILBERT_H


#ifdef SQUNICODE 
#define scvprintf vwprintf 
#else 
#define scvprintf vprintf 
#endif 

#define INITIAL_SQVM_STACK_SIZE 1024

void printfunc(HSQUIRRELVM v, const SQChar *s, ...) ;
void call_foo(HSQUIRRELVM v, int n,float f,const SQChar *s);

#endif
