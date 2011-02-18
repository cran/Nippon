pkgname <- "Nippon"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('Nippon')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("kakasi")
### * kakasi

flush(stderr()); flush(stdout())

### Name: kakasi
### Title: Interface to kakasi
### Aliases: kakasi
### Keywords: Japanese character

### ** Examples

## Not run: 
##D data(regions)
##D regions
##D kakasi(regions)
## End(Not run)



cleanEx()
nameEx("month.jp")
### * month.jp

flush(stderr()); flush(stdout())

### Name: month.jp
### Title: Japanese months
### Aliases: month.jp
### Keywords: datasets

### ** Examples

data(month.jp)
month.jp[1:3]



cleanEx()
nameEx("regions")
### * regions

flush(stderr()); flush(stdout())

### Name: regions
### Title: Japan regions
### Aliases: regions
### Keywords: datasets

### ** Examples

data(regions)
regions



cleanEx()
nameEx("sjis2utf8")
### * sjis2utf8

flush(stderr()); flush(stdout())

### Name: sjis2utf8
### Title: Wrapper of iconv for Japanese encoding
### Aliases: sjis2utf8 eucjp2utf8 jis2utf8
### Keywords: character Japanese

### ** Examples

x <- iconv(zenkaku$upper, from="UTF-8", to="CP932")
sjis2utf8(x)



cleanEx()
nameEx("zen2han")
### * zen2han

flush(stderr()); flush(stdout())

### Name: zen2han
### Title: Convert Japanese characters from fullwidth (zenkaku) to
###   halfwidth (hankaku) forms
### Aliases: zen2han
### Keywords: character Japanese

### ** Examples

zenkaku
zen2han(zenkaku)



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
