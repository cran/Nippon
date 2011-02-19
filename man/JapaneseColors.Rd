\name{JapaneseColors}
\alias{JapaneseColors}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Find RGB by Japanese color names}
\description{
\code{JapaneseColors} returns RGB values from Japanese traditional color names,
which are defined by Japanese Industrial Standard (JIS).
}
\usage{
JapaneseColors(names)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{names}{A chracter vector. The JIS name of Japanese traditional
		colors can be written in UTF-8 encoded Japanese (Kanji, or
		Hiragana), or Romaji (ASCII).}
}
\details{
The JIS Common Color Names (JIS Z 8102:2001) is definition of 269 colors
by JIS. \code{JapaneseColors} provides the RGB value in conformity to
the JIS Standards, referring the Japanese traditional color name. Note
that this
function only supports the JIS colors with Japanese traditional names (145 colors), and does
not support the JIS colors with English names (124 colors).
}
\value{A character vector}

\references{
JIS Z 8102:2001 (Names of non-luminous object colours)

K. Seino and I. Shimamori. Shikimeijiten. Tokyo:Sinkigensha, 2005.      
}
\author{Susumu Tanimura}

% \note{
% %%  ~~further notes~~
% }

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{nippon.palette}}
}
\examples{
JapaneseColors(c("sangoiro","kuriiro"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Japanese}
\keyword{color}% __ONLY ONE__ keyword per line
