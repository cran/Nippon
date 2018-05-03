\name{sanitizeZenkaku}
\alias{sanitizeZenkaku}

\title{Sanitizing strings contaminated with fullwidth (zenkaku) charactors.
}
\description{
	Sanitizing strings unintensionally contaminated with fullwidth
	(zenkaku) charactors by converting characters from fullwidth (zenkaku) to halfwidth
	(hankaku) forms.
}

\usage{
sanitizeZenkaku(s)
}
\arguments{
  \item{s}{A character vector. UTF-8 encoding is preferable.}
}

\details{
Occasionally a character vector is unintentionally contaminated with fullwidth (zenkaku)
characters. \code{sanitizeZenkaku} remove Japanese fullwidth (zenkaku) alphabets,
numbers, and symbols from the given character vector in order to make
logical and factor vectors work properly. The alphabets,
numbers, and symbols are substitute for halfwidth forms (aka. ASCII),
while a fullwidth space is simply removed. }

\value{
A character vector. All alphabets, numbers, and symbols have their halfwidth from.
}
\author{
Susumu Tanimura \email{aruminat@gmail.com}
}
\seealso{%
  \code{zen2han}
}
\examples{
(n <- intToUtf8(c(65296 + 1:3, 12288)))
sanitizeZenkaku(n)
}

