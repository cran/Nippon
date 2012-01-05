\name{zen2han}
\alias{zen2han}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Convert Japanese characters from fullwidth (zenkaku) to halfwidth
	(hankaku) forms 
}
\description{
This function is to convert Japanese characters from fullwidth (zenkaku) to halfwidth
(hankaku) forms for avoding trouble in Japanese string operation.
}
\usage{
zen2han(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A character vecter.
}
}
\details{
Japanese graphic characters are traditionally classed into fullwidth
(zenkaku) and halfwidth (hankaku) form. Alphabets, numbers, and symbols can
take either from, while Hiragana, Katakana, and Kanji are only available
as fullwidth characters. It causes troubles in string manipulation such as
matching or searching where the two forms of alphabets, numbers, and
symbols are mixed in. Thus, the character data should be sanitized with this
function.

The targeted zenkaku characters are shown with zenkaku constant built
into \pkg{Nippon} package: only alphabets and numbers. Katakana is not
the target of \code{zen2han} because the halfwidth Katakana is rather a
troublemaker.
}

\value{
A character vector. All alphabets, numbers, and symbols have their halfwidth from.
}
\references{
	Halfwidth and Fullwidth Forms \url{http://www.alanwood.net/unicode/halfwidth_and_fullwidth_forms.html}
}
\author{
Susumu Tanimura \email{aruminat@gmail.com}
}
% \note{
% %%  ~~further notes~~
% }
%% ~Make other sections like Warning with \section{Warning }{....} ~
\seealso{\code{\link[tools:showNonASCII]{showNonASCII}}}

\examples{
zenkaku
zen2han(zenkaku)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{character}
\keyword{Japanese}% __ONLY ONE__ keyword per line
