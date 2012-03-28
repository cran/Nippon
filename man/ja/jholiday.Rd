\name{jholiday}
\alias{jholiday}
\alias{is.jholiday}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{日本の祝日計算}
\description{
This function is to calculate public holidays in Japan for given year.
}
\usage{
jholiday(year, holiday.names = TRUE)
is.jholiday(dates)
}
%- maybe also 'usage' for other objects documented here.

\arguments{
  
\item{year}{A integer value, formatted as YYYY.  A year should be in anno Domini, and in and
  after 1949.  Only single value is accepted.}

\item{holiday.names}{ logical.  If FALSE, names of
  holiday are suppressed. The default value is TRUE.  }
\item{dates}{A date value or vector of dates}
}

\details{The function \code{jholiday} returns Japanese public holidays
of given year according to the Public Holiday Law of 1948.  All legal
reforms have so far been followed, but users should be careful about
holidays in the future because of possible change in law.  The function
\code{is.jholiday} answers to whether or not given date is holiday.}

\value{
The function \code{jholiday} returns an object of \code{Date} class with or without holiday
names.  The function \code{is.jholiday} returns a logical vector.
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
\note{
There are several other R functions to calculate holidays, including public
holiday in Japan; however, none of functions works correctly due to very
complicated holiday system in Japan, especially the Happy Monday System
and the citizens' holiday rule. Only \code{jholiday} may work
correctly. In case you get wrong results by the function
\code{jholiday}, please report to the author.
}
%% ~Make other sections like Warning with \section{Warning }{....} ~
\seealso{\code{\link[timeDate:holiday]{holiday}} in \pkg{timeDate} package,
  %% package ‘fCalendar’ is not available (for R version 2.15.2)
  %%  \code{\link[fCalendar:holiday]{holiday}} in \pkg{fCalendar} package,
  \code{\link[TimeWarp:holidays]{holidays}} in \pkg{TimeWarp} package,
  \code{\link[Holidays:Holidays]{Holidays}} in \pkg{Holidays} package.
}

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
