\name{prefectures}
\alias{prefectures}
\docType{data}
\title{Prefectural names in Japan}
\description{
\code{prefectures} provides the name of prefectures in Japan as well as
the regional name to be grouped.
}
\usage{data(prefectures)}
\format{
  A data frame with 47 observations on the following 3 variables.
  \describe{
    \item{\code{jiscode}}{a character vector}
    \item{\code{name}}{a character vector}
    \item{\code{region}}{a character vector}
  }
}
\details{
The prefectures of Japan are the country's 47 subnational
jurisdictions. \code{prefectures} provides the names in JIS code (JIS X
0401) order as UTF-8 encoded Japanese Kanji.The regions of Japan are
assigned to corresponding prefecture, even though such regional division
of Japan are not official
administrative units.
}

\note{
If you need the prefectural name in ASCII, \code{\link{kakasi}} can help to
convert Kanji to Romaji (ASCII). See the example showed below.
}
% \source{
% %%  ~~ reference to a publication or URL from which the data were obtained ~~
% }
% \references{
% %%  ~~ possibly secondary sources and usages ~~
% }
\examples{
data(prefectures)
head(prefectures)
\dontrun{
## Obtain the name as Romaji (ASCII)
kakasi(head(prefecture$name))
}
}
\keyword{datasets}
