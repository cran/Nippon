\name{wareki2AD}
\alias{wareki2AD}
\title{Conversion from Japanese imperial year to Anno Domini}
\description{
\code{wareki2AD} calculates a year for Anno Domini from Japanese
imperial year, which is widely used in official statistics and documents
in Japan.}
\usage{
wareki2AD(year)
}
\arguments{
  \item{year}{vector of Japanese calender year as strings.}
}

\details{
\code{year} should include numeric strings as a halfwidth (hankaku) forms
(aka ACSII). If you have fullwidth (zenkaku) figures in the numeric part of year, you
need to convert them to halfwidth characters before using
\code{wareki2AD}.

Noted that the supported the names of an era, ``gengo'', inlcude ``Meiji'',
``Taisho'', ``Showa'', and ``Heisei'' only.}

\value{character}
\author{Susumu Tanimura \email{aruminat@gmail.com}}
\examples{
\dontrun{
yr <- paste0(intToUtf8(c(24179,25104)), 20, intToUtf8(24180))
wareki2AD(yr)
}}
\keyword{Japanese language}
