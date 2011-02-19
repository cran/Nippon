\name{Nippon-internal}
\alias{Nippon-internal}
\alias{zenkaku}
\alias{jiscolors}
\alias{jdate}
%\docType{data}
\title{Internal objects in the Nippon package}
\description{
Internal objects in the Nippon package, which are only
user-visible because of the special nature of the Nippon name space.
}
\usage{
zenkaku
jiscolors
jdate
}
\format{
	zenkaku is a list, and jiscolors is a data frame.
}

\details{
Internal objects are loaded coincided with loading Nippon
package. \code{zenkaku} and \code{jiscolors} are used internally in
\code{\link{zen2han}} and \code{\link{JapaneseColors}}, respectively.

\code{zenkaku} has lower and upper case of alphabets and numbers in
fullwidth form. \code{jiscolors} is data of JIS colors, including Kanji,
Hiragana, and Romaji names.
}
% \source{
% %%  ~~ reference to a publication or URL from which the data were obtained ~~
% }
% \references{
% %%  ~~ possibly secondary sources and usages ~~
% }
% \examples{
% data(zenkaku)
% zenkaku
% }
% \keyword{datasets}
