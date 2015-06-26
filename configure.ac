## configure.ac for Nippon package
## Susumu Tanimura <aruminat@gmail.com>
## Time-stamp: <2015-06-26 09:52:25 umusus>

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

# Check for gcc >= 4.6
AC_PROG_CC
# gcc version 5.* is not considered here
if test "${GCC}" = yes; then
	 AC_MSG_CHECKING(version of gcc)
	 GCC_VERSION="`${CC} -dumpversion`"
	 GCC_MAJOR_VERSION="`echo ${GCC_VERSION} | cut -d. -f1`"
	 GCC_MINOR_VERSION="`echo ${GCC_VERSION} | cut -d. -f2`"
	 if test "${GCC_MAJOR_VERSION}" -eq "4" ; then
	 		if test "${GCC_MINOR_VERSION}" -ge "6" ; then
					PKG_CFLAGS="${PKG_CFLAGS} -Wno-unused-result"
					AC_MSG_RESULT([>= 4.6])
			else
					AC_MSG_RESULT([< 4.6])
			fi
	fi	
fi	

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
AC_DEFINE(VERSION, "2.3.6", [rkakasi_VERSION])

INLIBS="${LIBS}"
INCPPFLAGS="${CPPFLAGS}"
INPKG_CPPFLAGS="${PKG_CPPFLAGS}"
INPKG_LIBS="${PKG_LIBS}"

AC_SUBST([PKG_CPPFLAGS], ["${INPKG_CPPFLAGS} ${KAKASI_CPPFLAGS}"])
AC_SUBST([PKG_CFLAGS], ["${PKG_CFLAGS} ${KAKASI_CPPFLAGS}"])
AC_SUBST([PKG_LIBS], ["${INPKG_LIBS} ${KAKASI_LIBS}"])
AC_SUBST([CPICFLAGS], ["${CPICFLAGS}"])
AC_SUBST([CPPFLAGS], ["${CPPFLAGS}"])

## CPPFLAGS="${INCPPFLAGS} ${PKG_CPPFLAGS}" 

AC_CONFIG_FILES([src/Makevars src/kakasi/Makefile])
AC_OUTPUT
