\name{nippon.palette}
\alias{nippon.palette}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Switch the color palette to JIS colors}
\description{
\code{nippon.palette} switches the color palette to the Japanese
Industrial Standard (JIS) color palette, replacing with the
corresponding color in the default palette.
}

\usage{
nippon.palette()
}

\details{
JIS common color names (JIS Z 8102:2001) were defined by JIS as 269
colors. These colors are different from usual color in computers. For
example, red is #BE0032 in JIS color but #FF0000 in
usual. 
}
\value{an optional character vector}

\references{
JIS Z 8102:2001 (Names of non-luminous object colours)
K. Seino and I. Shimamori. Shikimeijiten. Tokyo:Sinkigensha, 2005.	
}
\author{
Susumu Tanimura
}

\note{
Use 'palette("default")' to restore the default color palette.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

% \seealso{
% %% ~~objects to See Also as \code{\link{help}}, ~~~
% }
\examples{
op <- par(mfrow=c(1,2))
palette("default")
n <- print(palette())
pie(rep(1,8),col=1:8,label=n)
nippon.palette()
pie(rep(1,8),col=1:8,label=n)
palette("default")
par(op)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Japanese}
\keyword{color}% __ONLY ONE__ keyword per line
