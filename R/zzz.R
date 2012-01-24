### Susumu Tanimura <aruminat@gmail.com>
### Time-stamp: <2013-01-24 20:09:38 umusus>
### .First.lib is no longer run

.onLoad <- function(libname, pkgname) { 
  library.dynam("Nippon", pkgname, libname)
}


