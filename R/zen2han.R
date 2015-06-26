zen2han <- function(s){
    if(Sys.info()["sysname"] == "Windows"){
        s <- iconv(s, from = "CP932", to = "UTF-8")
    }
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
## Old function
## zen2han <-
## function(x){
##   paste2 <- function(x,...){paste(x,...,sep='',collapse='')}
##   zen <- paste(unlist(zenkaku),collapse='')
##   han <- paste2(paste2(0:9),paste2(letters),paste2(LETTERS))
##   return(chartr(zen,han,x))
## }

