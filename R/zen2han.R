### Susumu Tanimura <aruminat@gmail.com>
### Time-stamp: <2018-05-03 17:53:49 umusus>

zen2han <- function(s){
    if(any(Encoding(s) != "UTF-8"))  s <- iconv(s, from = "", to = "UTF-8")
    s <- paste(s, sep='', collapse='')
    y <- sapply(unlist(strsplit(s, split = "")), function(x){
        i <- utf8ToInt(x)
        if(i >= 65281 && i <= 65374){
            return(intToUtf8(i - 65248))
        }else{
            return(x)
        }
    })
    return(paste(y, collapse = ""))
}

sanitizeZenkaku <-function(s){
    stopifnot(is.character(s))
    if(Encoding(s[1]) != "UTF-8")  s <- iconv(s, from = "", to = "UTF-8")
    zenEisu <- paste0(intToUtf8(65295 + 1:10), intToUtf8(65312 + 1:26),
                      intToUtf8(65344 + 1:26))
    zenKigo <- c(65281, 65283, 65284, 65285, 65286, 65290, 65291,
                 65292, 12540, 65294, 65295, 65306, 65307, 65308,
                 65309, 65310, 65311, 65312, 65342, 65343, 65372,
                 65374)
    s <- chartr(zenEisu,"0-9A-Za-z", s)
    s <- chartr(intToUtf8(zenKigo), '!#$%&*+,-./:;<=>?@^_|~', s)
    s <- gsub(intToUtf8(12288), "", s)
    return(s)
}

han2zen <- function(s){
    stopifnot(is.character(s))
    zenEisu <- paste0(intToUtf8(65295 + 1:10), intToUtf8(65312 + 1:26),
                      intToUtf8(65344 + 1:26))
    zenKigo <- c(65281, 65283, 65284, 65285, 65286, 65290, 65291,
                 65292, 12540, 65294, 65295, 65306, 65307, 65308,
                 65309, 65310, 65311, 65312, 65342, 65343, 65372,
                 65374)
    s <- chartr("0-9A-Za-z", zenEisu, s)
    s <- chartr('!#$%&*+,-./:;<=>?@^_|~', intToUtf8(zenKigo), s)
    s <- gsub(" ", intToUtf8(12288), s)
    return(s)
}
    

