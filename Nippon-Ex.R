pkgname <- "Nippon"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('Nippon')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("JapaneseColors")
### * JapaneseColors

flush(stderr()); flush(stdout())

### Name: JapaneseColors
### Title: Find RGB by Japanese color names
### Aliases: JapaneseColors
### Keywords: Japanese color

### ** Examples

JapaneseColors(c("sangoiro","kuriiro"))



cleanEx()
nameEx("jyear")
### * jyear

flush(stderr()); flush(stdout())

### Name: jyear
### Title: Convert Japanese year style
### Aliases: jyear
### Keywords: Japanese manip

### ** Examples

jyear(2000,ascii=TRUE)
jyear(2000,withAD=TRUE,ascii=TRUE)
jyear(1989,ascii=TRUE)
jyear(1989,shift=TRUE,ascii=TRUE)



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
##D library(Nippon)
##D data(prefectures)
##D regions <- unique(prefectures$region)
##D regions
##D kakasi(regions)
## End(Not run)



cleanEx()
nameEx("month.name.jp")
### * month.name.jp

flush(stderr()); flush(stdout())

### Name: month.name.jp
### Title: The Japanese name of months
### Aliases: month.name.jp
### Keywords: datasets

### ** Examples

data(month.name.jp)
month.name.jp[which(month.name=="April")]



cleanEx()
nameEx("nippon.palette")
### * nippon.palette

flush(stderr()); flush(stdout())

### Name: nippon.palette
### Title: Switch the color palette to JIS colors
### Aliases: nippon.palette
### Keywords: Japanese color

### ** Examples

op <- par(mfrow=c(1,2))
palette("default")
n <- print(palette())
pie(rep(1,8),col=1:8,label=n)
nippon.palette()
pie(rep(1,8),col=1:8,label=n)
palette("default")
par(op)



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("prefectures")
### * prefectures

flush(stderr()); flush(stdout())

### Name: prefectures
### Title: Prefectural names in Japan
### Aliases: prefectures
### Keywords: datasets

### ** Examples

data(prefectures)
head(prefectures)
## Not run: 
##D ## Obtain the name as Romaji (ASCII)
##D kakasi(head(prefecture$name))
## End(Not run)



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
