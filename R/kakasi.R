# Copyright (c) 2007 Susumu Tanimura

kakasi <- function(x, kakasi.option="-Ha -Ka -Ja -Ea -ka", invisible=TRUE) {
  K <- Sys.which("kakasi")
  if (nchar(K) == 0 || !file.exists(K)) stop("kakasi not found")
  k.cmd <- function(i, encoding.from, encoding.to){
    cmd <- paste("echo ",i,"| kakasi ",kakasi.option,"-i",encoding.from,
                 "-o",encoding.to)
    return(cmd)
  }    
  if (.Platform$OS.type == "windows") {
    encoding.from <- "sjis"
    encoding.to <- "sjis"
    res <- sapply(x, function(i) system(k.cmd(i, encoding.from, encoding.to),
                                        intern=TRUE, invisible=invisible))
    }
  else {
    encoding.from <- "utf8"
    encoding.to <- "utf8"
    res <- sapply(x, function(i) system(k.cmd(i, encoding.from, encoding.to), intern=TRUE))
    }
  if (any(grep("Can't init", res))) 
    stop("Cannot run kakasi: check connexion")
  ## res <- read.table(con <- textConnection(res), fill=TRUE, ...)
  ## close(con)
  return(res)
}

