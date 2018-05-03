### Susumu Tanimura <aruminat@gmail.com>
### Time-stamp: <2017-11-28 15:18:12 umusus>
### convert kansuji to arabic figure

kansu2arabic <- function(s){
    stopifnot(is.character(s))
    n <- list()
    k <- intToUtf8(c(12295, 38646, 19968, 22769, 20108, 24336, 19977,
                     21442, 22235, 20116, 20845, 19971, 20843, 20061,
                     21313, 25342, 30334, 20336, 21315, 38433, 19975,
                     33836, 20740, 20806))
    s <- chartr(substring(k, 1, 14),"00112233456789", s)
    sv <- unlist(strsplit(s, ""))
    u9999 <- function(ss){
        k2 <- unlist(strsplit(substring(k, 15, 20), ""))
        n2 <- unlist(strsplit(ss, ""))
        n2 <- gsub('([0-9])', '\\1*', n2)
        n2 <- sub(intToUtf8(c(21313, 124, 25342)), "10+", n2)
        n2 <- sub(intToUtf8(c(30334, 124, 20336)), "100+", n2)
        n2 <- sub(intToUtf8(c(21315, 124, 38433)), "1000+", n2)
##        print(paste("n2=",n2))
        f <- sub('(\\+$|\\*$)', '', paste(n2, collapse = ""))
##        print(paste("f=",f))
        res <- eval(parse(text = f))
        return(res)
    }
    if(length(which(sv == substring(k, 24, 24))) > 0){
        a <- substr(s, 1, which(sv == substring(k, 24, 24)) - 1)
        n$cho <- u9999(a)
        s <- substr(s, which(sv == substring(k, 24, 24)) + 1, nchar(s))
        sv <- unlist(strsplit(s, ""))
    }else{
        n$cho <- 0
    }
    if(length(which(sv == substring(k, 23, 23))) > 0){
        a <- substr(s, 1, which(sv == substring(k, 23, 23)) - 1)
        n$oku <- u9999(a)
        s <- substr(s, which(sv == substring(k, 23, 23)) + 1, nchar(s))
        sv <- unlist(strsplit(s, ""))
    }else{
        n$oku <- 0
    }
    if(length(which(sv == substring(k, 21, 21))) > 0){
        a <- substr(s, 1, which(sv == substring(k, 21, 21)) - 1)
        n$man <- u9999(a)
        s <- substr(s, which(sv == substring(k, 21, 21)) + 1, nchar(s))
        sv <- unlist(strsplit(s, ""))
    }else{
        n$man <- 0
    }
    n$lower <- u9999(s)
    manshin <-  c(10^12, 10^8, 10^4, 1)
    return(sum(unlist(n) * manshin))
}

kansuExample <- function(){
    a <- c(21313, 20806, 19968, 20740, 21315, 30334, 19977, 21313, 20108)
    b <- c(22769, 38433, 20116, 20336)
    res <- sapply(list(a, b), intToUtf8)
    return(res)
}

