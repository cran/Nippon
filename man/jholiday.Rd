\name{jholiday}
\alias{jholiday}
\alias{is.jholiday}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Calculate public holidays in Japan}
\description{
This function is to calculate public holidays in Japan for given year.
}
\usage{
jholiday(year, holiday.names = TRUE)
is.jholiday(dates)
}
%- maybe also 'usage' for other objects documented here.

\arguments{
	
\item{year}{A numeric value. A year should be in anno Domini, and in and
	after 1949. Only single value is accepted.}

\item{holiday.names}{ logical. If FALSE, names of
	holiday are suppressed. The default value is TRUE.  }
\item{dates}{date vector}
}

\details{ \code{jholiday} returns Japanese public holidays in given year
according to the Public Holiday Law of 1948. All legal reforms have so
far been followed, but users should be careful about holidays in the
future because of possible change in law.. \code{is.jholiday} answers
to whether or not given date is holiday.}

\value{
\code{jholiday} gives date vector with or without holiday
names. \code{is.jholiday} returns logical vectors.
}
\references{
	Public Holiday Law
	\url{http://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html}
	Ephemeris Computation Workshop (1991) Sinkoyomi-benricho, Koseisha
	Koseikaku: Tokyo, 1991, ISBN:9784769907008.
}
\author{
Susumu Tanimura \email{aruminat@gmail.com}
}
% \note{
% %%  ~~further notes~~
% }
%% ~Make other sections like Warning with \section{Warning }{....} ~
\seealso{\code{\link[timeDate:holiday]{holiday}}}

\examples{
jholiday(2013)
d <- as.Date(c("2000-09-22","2013-11-04", "1968-01-27"))
is.jholiday(d)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{holiday}
\keyword{Japan}
% __ONLY ONE__ keyword per line
