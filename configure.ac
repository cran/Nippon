## configure.ac for Nippon package
## Susumu Tanimura <aruminat@gmail.com>
## Time-stamp: <2013-04-08 09:37:29 umusus>

define([pkgversion], esyscmd([sh -c "grep Version: DESCRIPTION | cut -d' ' -f2 | tr -d '\n'"]))

AC_PREREQ([2.68])
AC_INIT(rkakasi, [pkgversion], aruminat@gmail.com)
AC_CONFIG_SRCDIR([src/rkakasi.c])
AC_CONFIG_HEADER([src/kakasi/config.h])

# find R home and set correct compiler + flags
: ${R_HOME=`R RHOME`}
if test -z "${R_HOME}"; then
  AC_MSG_ERROR([cannot determine R_HOME. Make sure you use R CMD INSTALL!])
fi
RBIN="${R_HOME}/bin/R"

# pick all flags for testing from R
: ${CC=`"${RBIN}" CMD config CC`}
: ${CXX=`"${RBIN}" CMD config CXX`}
: ${CPP=`"${RBIN}" CMD config CPP`}
: ${CFLAGS=`"${RBIN}" CMD config CFLAGS`}
: ${CPICFLAGS=`"${RBIN}" CMD config CPICFLAGS`}
: ${CPPFLAGS=`"${RBIN}" CMD config CPPFLAGS`}
: ${LDFLAGS=`"${RBIN}" CMD config LDFLAGS`}

AC_PROG_RANLIB

# Check for gcc
# AC_PROG_CC
# if test -n "$GCC"; then
##  CFLAGS="$CFLAGS -Wall -Wunused -Wuninitialized -Wmissing-prototypes -Wmissing-declarations -pedantic -Wno-unused-result"
# CFLAGS="$CFLAGS -Wno-unused-result"
# fi

AC_CHECK_HEADERS([malloc.h stdlib.h string.h strings.h])
AC_TYPE_SIZE_T
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([memmove strdup])

AC_MSG_NOTICE([${PACKAGE_NAME}: ${PACKAGE_VERSION}])

dnl ======== imported from kakasi's configure.in ======
dnl Here, check compile options for kakasi
AC_MSG_CHECKING(for wakatigaki)
AC_ARG_ENABLE(wakatigaki,
[  --enable-wakatigaki     wakatigaki [default=yes]])
if test "${enable_wakatigaki+set}" != set; then
  wakatigaki=yes
else
  case "${enable_wakatigaki}" in
    yes) wakatigaki=yes ;;
    no) wakatigaki=no ;;
  esac
fi
AC_MSG_RESULT($wakatigaki)
test "${wakatigaki}" = yes && AC_DEFINE(WAKATIGAKI, 1, [WAKATIGAKI])

AC_MSG_CHECKING(for eachyomi)
AC_ARG_ENABLE(eachyomi,
[  --enable-eachyomi       eachyomi [default=yes]])
if test "${enable_eachyomi+set}" != set; then
  eachyomi=yes
else
  case "${enable_eachyomi}" in
    yes) eachyomi=yes ;;
    no) eachyomi=no ;;
  esac
fi
AC_MSG_RESULT($eachyomi)
test "${eachyomi}" = yes && AC_DEFINE(EACH_YOMI, 1, [EACH_YOMI])
dnl ========= end of import ===========================
### Since rkakasi.c support utf-8, utf8 conversion function in kakasi is killed.
AC_DEFINE(VERSION, "2.3.5pre1")

INLIBS="${LIBS}"
INCPPFLAGS="${CPPFLAGS}"
INPKG_CPPFLAGS="${PKG_CPPFLAGS}"
INPKG_LIBS="${PKG_LIBS}"

AC_SUBST([PKG_CPPFLAGS], ["${INPKG_CPPFLAGS} ${KAKASI_CPPFLAGS}"])
AC_SUBST([PKG_LIBS], ["${INPKG_LIBS} ${KAKASI_LIBS}"])
AC_SUBST([CPICFLAGS], ["${CPICFLAGS}"])
AC_SUBST([CPPFLAGS], ["${CPPFLAGS}"])

## CPPFLAGS="${INCPPFLAGS} ${PKG_CPPFLAGS}" 

AC_CONFIG_FILES([src/Makevars src/kakasi/Makefile])
AC_OUTPUT
