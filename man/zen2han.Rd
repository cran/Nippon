\name{zen2han}
\alias{zen2han}
\alias{han2zen}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Convert Japanese characters from fullwidth (zenkaku) to halfwidth
	(hankaku) forms, and vice versa.
}
\description{
This function is to convert Japanese characters between fullwidth
(zenkaku) and halfwidth
(hankaku) forms for avoiding trouble in Japanese string operation or for
taking advantage of fullwidth (zenkaku) forms.
}
\usage{
zen2han(s)
han2zen(s)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{s}{
A character vector. UTF-8 encoding is preferable.
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

The targeted zenkaku characters are numbers, alphabets, punctuation
marks, and other special symbols. Katakana is not the target of
\code{zen2han} because the halfwidth Katakana is rather a troublemaker.

\code{han2zen} functions reversely. This is useful for Japanese
users to escape prohibitive characters in strings (e.g., '$' in
a character vector).
}

\value{
\code{zen2han} returns a character vector. All alphabets, numbers, and
symbols have their halfwidth from.

\code{han2zen} returns a character vector. All alphabets, numbers, and
symbols have their fullwidth from.
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
\seealso{\code{han2zen}, \code{\link[tools:showNonASCII]{showNonASCII}}}

\examples{
zenkaku
zen2han(as.character(zenkaku))
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{character}
\keyword{Japanese language}
% __ONLY ONE__ keyword per line
