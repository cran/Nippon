\name{kakasi}
\alias{kakasi}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Interface to kakasi}

\description{
The \code{kakasi} is an interface to the external program kakasi,
KAnji KAna Simple Inverter. It is useful especially when Japanese Kanji
characters are subject to convert to Romaji (ASCII) characters.
}
\usage{
kakasi(x, kakasi.option="-Ha -Ka -Ja -Ea -ka", invisible=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{A character vector}
	\item{kakasi.option}{Options passed to kakasi program}
	% \item{romaji}{Romaji conversion system: "hepburn", or "kunrei". Default is
	% "hepburn"}
	\item{invisible}{Under Windows, do not open an extra window}
}
\details{
Japanese strings are often made up a mixture of Chinese characters
(Kanji), Kana (Hiragana and Katakana) and Romaji (Latin phonetical
pronunciation). The external program kakasi converts between these four
different ways of writing Japanese. The function wraps the external
program kakasi with system(). The kakasi program must be present and on
the user's PATH for the function to work. \code{kakasi} is useful
especially for sanitizing a character vector by converting Japanese
(non-ASCII) to ASCII characters.
}
\value{
A character vector
}
\references{
	KAKASI - Kanji Kana Simple Inverter \url{http://kakasi.namazu.org/}
}
\author{
Susumu Tanimura \email{aruminat@gmail.com}
}
\note{
The accuracy of Kanji-Kana conversion with kakasi is a bit lower
than with MeCab program (http://mecab.sourceforge.net/). Although MeCab
does not have a function of Kana-Romaji conversion, MeCab could be an option
if you wish more accurate results. RMeCab is available from
http://rmecab.jp/wiki/.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

% \seealso{
% %% ~~objects to See Also as \code{\link{help}}, ~~~
% }
\examples{
\dontrun{
library(Nippon)
data(prefectures)
regions <- unique(prefectures$region)
regions
kakasi(regions)
}
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Japanese}
\keyword{character}% __ONLY ONE__ keyword per line
