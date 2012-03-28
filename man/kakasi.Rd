\name{kakasi}
\alias{kakasi}
\alias{Sys.kakasi}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{Interface to kakasi}

\description{
The \code{kakasi} is an interface to the external program kakasi,
KAnji KAna Simple Inverter. It is useful especially when Japanese Kanji
characters are subject to convert to Romaji (ASCII) characters.
}
\usage{
kakasi(x, kakasi.option="-Ha -Ka -Ja -Ea -ka",
 ITAIJIDICTPATH = Sys.getenv("ITAIJIDICTPATH", unset = NA),
 KANWADICTPATH = Sys.getenv("KANWADICTPATH", unset = NA))

Sys.kakasi(x, kakasi.option="-Ha -Ka -Ja -Ea -ka", invisible=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{A character vector}
	\item{kakasi.option}{A chracter string specifying the options passed
		to kakasi library/program}
	% \item{romaji}{Romaji conversion system: "hepburn", or "kunrei". Default is
	% "hepburn"}
	\item{ITAIJIDICTPATH}{A character string specifying the path to
		itaijidict.  Environmental variable of itaijidict passed to
		kakasi library.}
	\item{KANWADICTPATH}{A character string specifying the path to
		kanwadict.  Environmental variable of kanwadict passed to
		kakasi library.}
	\item{invisible}{Under Windows, do not open an extra window}
}
\details{
Japanese strings are often made up a mixture of Chinese characters
(Kanji), Kana (Hiragana and Katakana) and Romaji (Latin phonetical
pronunciation). The external program kakasi converts between these four
different ways of writing Japanese. \code{kakasi} and \code{Sys.kakasi}
are useful especially for sanitizing a character vector by converting
Japanese (non-ASCII) to ASCII characters.

\code{kakasi} uses two basic dictionaries: itaijidict and
kanwadict. These dictionaries are included in doc/share of Package
directory after installation of Nippon package. Since the kakasi library
looks up the environmental variables to find dictionary, ITAIJIDICTPATH
and KANWADICTPATH are internally set using \code{Sys.setenv} at the time
when \code{kakasi} is called first time. After the first call,
\code{kakasi} continues to use the environmental variables. Until R
session closes, these environmental variables never unset. To use
alternative dictionary instead of the bundled, a user can set the
environmental variables using \code{Sys.setenv} or as arguments of
\code{kakasi}. For permanent setting of environmental variables, see
help of Renviron.

The \code{Sys.kakasi} wraps the external program kakasi with
\code{system}. The kakasi program must be installed and confirmed to
correctly work outside of R. This function is simply for compatibility
with the \code{kakasi} in previous Nippon package, and will be removed
for the future version. 
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
\code{Sys.kakasi} was renamed from \code{kakasi} in Nippon ver.0.2.2,
and remained as a transitional function. It will be removed in the future.

\code{kakasi} warns unless LC_CTYPE is "ja_JP.UTF-8" (Linux or MacOSX)
or "Japanese_Japan.932" (Windows).

The accuracy of Kanji-Kana conversion with kakasi is a bit lower
than with MeCab program (http://mecab.sourceforge.net/). Although MeCab
does not have a function of Kana-Romaji conversion, MeCab could be an option
if you wish more accurate results. RMeCab is available from
http://rmecab.jp/wiki/.
}

\section{Warning}{
	Note that non-Japanese and non-ASCII characters are not filtered in
	\code{kakasi}.\code{kakasi} warns unless LC_CTYPE is "ja_JP.UTF-8"
	(Linux or MacOSX) or "Japanese_Japan.932" (Windows). It is not sure
	whether the function is workable in other locale.
}

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
\keyword{Japanese language}
\keyword{character}% __ONLY ONE__ keyword per line
