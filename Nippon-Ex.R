pkgname <- "Nippon"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('Nippon')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("JapanPrefecturesMap")
### * JapanPrefecturesMap

flush(stderr()); flush(stdout())

### Name: JapanPrefecturesMap
### Title: A simple choropleth map of Japan
### Aliases: JapanPrefecturesMap
### Keywords: character Japanese language

### ** Examples

if (require(RColorBrewer)) {
  cols <- rev(brewer.pal(12,"Set2"))
}else{
  cols <- gray.colors(12)
}
JapanPrefecturesMap(col = cols, axes = TRUE)

require(foreign)
dat <- read.dbf(system.file("shapes/jpn.dbf", package="Nippon"))
op <- par(bg = "skyblue")
p <- JapanPrefecturesMap(col = "ivory")
col <- c("olivedrab4", "olivedrab1")
pop <- dat$population / 1e+7
symbols(p, circles = sqrt(pop / (2 * pi)), inches = FALSE,
    fg = col[1], bg = col[2], add = TRUE)
idx <- c(1e+6, 5e+6, 1e+7)
pos <- legend("bottomright", legend = format(idx, scientific = 10, big.mark = ","),
    title = "Population (2010)", bg = "white", x.intersp = 2, y.intersp = 1.5)
symbols(pos$text$x - 1, pos$text$y, circles = sqrt(idx / 1e+7 / (2 * pi)),
    inches = FALSE, fg = col[1], bg = col[2], add = TRUE)
par(op)




graphics::par(get("par.postscript", pos = 'CheckExEnv'))
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
nameEx("jholiday")
### * jholiday

flush(stderr()); flush(stdout())

### Name: jholiday
### Title: Calculate public holidays in Japan
### Aliases: jholiday is.jholiday
### Keywords: holiday Japan

### ** Examples

    jholiday(2013)
    d <- as.Date(c("2000-09-22","2013-11-04", "1968-01-27"))
    is.jholiday(d)



cleanEx()
nameEx("jyear")
### * jyear

flush(stderr()); flush(stdout())

### Name: jyear
### Title: Conversion to Japanese year style
### Aliases: jyear
### Keywords: Japanese language

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
### Aliases: kakasi Sys.kakasi
### Keywords: Japanese language character

### ** Examples

## Not run: 
##D library(Nippon)
##D data(prefectures)
##D regions <- unique(prefectures$region)
##D regions
##D kakasi(regions)
## End(Not run)



cleanEx()
nameEx("kata2hira")
### * kata2hira

flush(stderr()); flush(stdout())

### Name: kata2hira
### Title: Conversion form Katakana to Hiragana
### Aliases: kata2hira hira2kata hiragana katakana ya.hira2kata
###   ya.kata2hira
### Keywords: Japanese language character

### ** Examples

	library(Nippon)
	(kata <- katakana()[26:30])
	kata2hira(kata)
	(hira <- hiragana()[21:25])
	hira2kata(hira)



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
### Keywords: datasets Japan

### ** Examples

data(prefectures)
head(prefectures)
## Not run: 
##D ## Obtain the name as Romaji (ASCII)
##D kakasi(head(prefecture$name))
## End(Not run)



cleanEx()
nameEx("romanization")
### * romanization

flush(stderr()); flush(stdout())

### Name: romanization
### Title: Romanization of Japanese
### Aliases: kana2roma
### Keywords: Japanese language character

### ** Examples

	library(Nippon)
	jpn <- c(hiragana()[21:25], katakana()[26:30])
	kana2roma(jpn)



cleanEx()
nameEx("sjis2utf8")
### * sjis2utf8

flush(stderr()); flush(stdout())

### Name: sjis2utf8
### Title: Wrapper of iconv for Japanese encoding
### Aliases: sjis2utf8 eucjp2utf8 jis2utf8
### Keywords: character Japanese language

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
### Keywords: character Japanese language

### ** Examples

zenkaku
zen2han(zenkaku)



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
