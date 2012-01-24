\name{Nippon-internal}
\alias{Nippon-internal}
\alias{zenkaku}
\alias{jiscolors}
\alias{jdate}
\alias{jpn.syllabary}
\alias{jpn.syllabary.add}

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
jpn.syllabary
jpn.syllabary.add
}
\format{
	zenkaku is a list, and jiscolors is a data frame. jpn.syllabary and
	jpn.syllabary.add are character data frames.
}

\details{
Internal objects are loaded coincided with loading Nippon
package. \code{zenkaku} and \code{jiscolors} are used internally in
\code{\link{zen2han}} and \code{\link{JapaneseColors}}, respectively.
\code{jpn.syllabary} and \code{jpn.syllabary.add} internally provide
conversion tables for \code{\link{hira2kata}}, \code{\link{kata2hira}},
and \code{\link{kana2roma}}.

\code{zenkaku} has lower and upper case of alphabets and numbers in
fullwidth form. \code{jiscolors} is data of JIS colors, including Kanji,
Hiragana, and Romaji names.

\code{jpn.syllabary} is a conversion table, including Hiragana,
Katakana, three main systems for the romanization of Japanese: Hepburn,
Nihon-shiki and Kunrei-shiki.

\code{jpn.syllabary.add} is an unofficial conversion table, but it is
widely used especially in ICT. 
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

%%  LocalWords:  zen2han JapaneseColors hira2kata kata2hira kana2roma
%%  LocalWords:  fullwidth JIS Kanji Romaji romanization Nihon shiki
%%  LocalWords:  Kunrei
