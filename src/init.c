#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

#include <Rinternals.h> // for SEXP
extern void R_init_Nippon(DllInfo *dll);
extern SEXP rkakasi(SEXP x, SEXP k);

#define CALLDEF(name, n)  {#name, (DL_FUNC) &name, n}

static const R_CallMethodDef R_CallDef[] = {
   CALLDEF(rkakasi, 2),
   {NULL, NULL, 0}
};

void R_init_Nippon(DllInfo *dll)
{
	R_registerRoutines(dll, NULL, R_CallDef, NULL, NULL);
	R_useDynamicSymbols(dll, FALSE);
}

