zen2han <-
function(x){
  paste2 <- function(x,...){paste(x,...,sep='',collapse='')}
  zen <- paste(unlist(zenkaku),collapse='')
  han <- paste2(paste2(0:9),paste2(letters),paste2(LETTERS))
  return(chartr(zen,han,x))
}

