\name{sjis2utf8}
\alias{sjis2utf8}
\alias{eucjp2utf8}
\alias{jis2utf8}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Wrapper of iconv for Japanese encoding}

\description{
	These functions are to encode Japanese characters from SJIS/JIS/EUC-JP
	to UTF-8.
}

\usage{
sjis2utf8(x, CP932=TRUE)
eucjp2utf8(x)
jis2utf8(x)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{A character vecter}
	\item{CP932}{logical. If you like to use Shift-JIS instread of CP932,
	set \code{CP932 = FALSE}. The default is TRUE}
}

\details{
The major Japanese encoding systems are Shift-JIS (CP932), JIS
(ISO-2022-JP), EUC-JP, and recently UTF-8. Exchanging Japanese strings
data between the different platforms is often the cause of unreadable
illegal characters. Since \command{iconv} could be the solution of this
issues, these functions are written for the handy use of \command{iconv}, in
partifular, when importing an old dataset or from the different platform.
}

\value{A character vector}

% \references{
% }
\author{Susumu Tanimura \email{aruminat@gmail.com}}
% \note{
% %%  ~~further notes~~
% }

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
	\code{\link[base]{iconv}} and \code{\link[utils]{localeToCharset}}.
}



\examples{
x <- iconv(zenkaku$upper, from="UTF-8", to="CP932")
sjis2utf8(x)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{character}
\keyword{Japanese}% __ONLY ONE__ keyword per line
