/*                              */
/*          rkakasi             */
/*                              */

#include <stdio.h>
#include <string.h>
#include "kakasi/libkakasi.h"
#include <R.h>
#include <Rinternals.h>
#include <R_ext/Riconv.h>

SEXP rkakasi(SEXP x, SEXP k)
{
	/* 環境変数の設定 */
	/* TODO:呼び出し側のプログラムの引数で辞書を指定できるようにする */
	/* putenv("ITAIJIDICTPATH=/tmp/share/kakasi/itaijidict"); */
	/* putenv("KANWADICTPATH=/tmp/share/kakasi/kanwadict"); */
	/* putenv("ITAIJIDICTPATH=/usr/share/kakasi/itaijidict"); */
	/* putenv("KANWADICTPATH=/usr/share/kakasi/kanwadict"); */

	/* ここから */
	int ret, i;
	R_len_t len = length(k); /* Otherwise, Rint len = Rf_length(k); */
	PROTECT(x = coerceVector(x, STRSXP));
	char *x1;
	x1 = R_alloc(strlen(CHAR(STRING_ELT(x, 0))), sizeof(char)); /* allocation to memory */
	strcpy(x1, CHAR(STRING_ELT(x, 0)));

	PROTECT(k = coerceVector(k, STRSXP));
	char *k1[len];
	for (i = 0; i < len; i++){
		k1[i] = R_alloc(strlen(CHAR(STRING_ELT(k, i))), sizeof(char)); /* allocation to memory */
		strcpy(k1[i], CHAR(STRING_ELT(k, i)));
	}

	/* UTF-8 to EUC-JP */
	char text2[256];
	char const *pin;
	char *pout;
	size_t ilen, rlen;
	int * cd = Riconv_open("EUC-JP", "UTF-8");
	if(cd == (int * )-1){
		perror("iconv open");
		/* return; */
	}
	ilen = strlen(x1);
	rlen = sizeof(text2)-1;
	pin  = x1; 
	pout = text2;
	rlen = Riconv(cd,&pin, &ilen, &pout, &rlen);
	if (rlen == -1) {
		perror("iconv");
		/* return ; */
	}
	*pout = '\0';
	Riconv_close(cd);

  ret = kakasi_getopt_argv(len, k1);			/* kは配列。引数は整数、ポインタのポインタ、戻値は整数 */
	if(ret != 0) {
		REprintf("ERROR1\n");
			/* return R_NilValue; segfault. */
	}

	char * r = kakasi_do(text2);				/* 戻り値はEUC-JPのchar *型 */

	/* EUC-JP to UTF-8 */
	cd = Riconv_open("UTF-8", "EUC-JP");
	if(cd == (int * )-1){
		perror("iconv open");
		/* return; */
	}

	ilen = strlen(r);
	rlen = sizeof(text2)-1;
	pin  = r; 
	pout = text2;
	rlen = Riconv(cd,&pin, &ilen, &pout, &rlen);
	if (rlen == -1) {
		perror("iconv");
		/* return ; */
	}
	kakasi_free(r);
	*pout = '\0';
	Riconv_close(cd);

	UNPROTECT(2);
	return Rf_ScalarString(mkChar(text2));
}
