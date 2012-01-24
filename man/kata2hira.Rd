\name{kata2hira}
\alias{kata2hira}
\alias{hira2kata}
\alias{hiragana}
\alias{katakana}
\alias{ya.hira2kata}
\alias{ya.kata2hira}

\title{Conversion form Katakana to Hiragana}

\description{
	Functions to convert from Katakana to Hiragana, vise versa. 
}

\usage{
kata2hira(x)
hira2kata(x)
ya.kata2hira(x)
ya.hira2kata(x)
hiragana()
katakana()
}

\arguments{
  \item{x}{A character vector including Japanese Hiragana or Katakana}
}

\details{
	\code{kata2hira} and \code{ya.kata2hira} converts from Katakana to
	Hiragana. \code{hira2kata} and \code{ya.hira2kata} converts from
	Hiragana to Katakana. \code{hiragana} and \code{katakana} generate
	Hiragana and Katakana, respectively, from the UTF-8 code table.  It
	may be useful when users need Kana characters where no Kana input
	method is available.
}

\value{
A character vector
}

%% \references{ }
\author{
Susumu Tanimura \email{aruminat@gmail.com}
}
\note{
	The difference between \code{kata2hira} and \code{ya.kata2hira} or
	between \code{hira2kata} and \code{ya.hira2kata} is in the algorithm,
	causing difference cacluatiion cost and output results.
}

%\seealso{}

\examples{
	library(Nippon)
	(kata <- katakana()[26:30])
	kata2hira(kata)
	(hira <- hiragana()[21:25])
	hira2kata(hira)
}

\keyword{Japanese language}
\keyword{character}
