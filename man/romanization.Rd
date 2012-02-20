\name{romanization}
\alias{kana2roma}
\alias{.syllabicate.hira}

\title{Romanization of Japanese}

\description{
Japanese characters in a string or character vector are romanized with
the their sounds for the English-speaking world. While
\code{\link{kakasi}} in \pkg{Nippon} package works for romanization of
Japanese, alternative romaization of Japanese is limitedly avaiable
with \code{kana2roma}. Unlike the \code{kakasi} function,
\code{kana2roma} works without any help of an external program.
}

\usage{
kana2roma(x, type = c("Hepburn", "Nippon.shiki", "Kunrei.shiki"), 
    cap = FALSE, ascii.only = TRUE)
.syllabicate.hira(y)
}

\arguments{
  \item{x}{A character vector including Japanese Hiragana or Katakana}
  \item{y}{A character vector including Japanese Hiragana only}
  \item{type}{A type of romanization. Default is "Hepburn"}
  \item{cap}{logical. Capital letters to be uppercased, Default is FALSE}
  \item{ascii.only}{logical. Transcribed with ASCII characters only. Default is TRUE}
}

\details{
  Japanese strings are often made up a mixture of Chinese characters
  (Kanji), Kana (Hiragana and Katakana) and Romaji (Latin phonetical
  pronunciation). \code{kana2roma} transcribes Kana to Romaji without
  any help of external programs, such as kakasi. It should be useful
  especially when users want to sanitize and make readable Japanese
  strings in data set for the English-speaking world. The function
  supports three main romanization systems. Although the Nihon-shiki
  (ISO3602 Strict) is the official system in Japan, Hepburn is most
  widely used especially for proper noun, and officially adopted in
  naming systems for railway station and roads. A variant of Hepburn is
  authorized by the Japanese Foreign Ministry for use in passports.

	For place names or other proper nouns, set ``\code{cap = TRUE}'' in
	\code{kana2roma} (default is FALSE) to capitalize the first letters
	in Romaji strings.  
	
  Set ``\code{ascii.only = TRUE}'' in \code{kana2roma} (this is default)
	if a user needs to suppress non-ASCII Romaji. Otherwise, a pure
	romanization system may return values with non-ASCII codes, that is,
	macron.

	\code{.syllabicate.hira} is internally used in \code{kana2roma}, and
	not for users. This syllabicates Hiragana. Other chacters in the
	string are split into single characters.
	
}

\value{ A character vector }
%% \references{ }
\author{
Susumu Tanimura \email{aruminat@gmail.com}
}
\note{
	\code{kana2roma} supports only Kana (Hiragana and Katakana). All other
	characters are just ignored and output as it is. If users need convert
	from Kanji to Romaji, use \code{\link{kakasi}} instead of
	\code{kana2roma}.
	
	Rigidly, there are many variants of the three main romanization
	systems with small differences. Yet another romanization is used in
	an input methods engine of computers. Since the function strictly and
	simply follows the three romanization systems, some Kana characters
	may be failed due to lack of authorized conversion rules. Yet, some
	unsupported conversion rules will be implemented as optional 
	in the future.
}

\seealso{
	See Also as \code{\link{kakasi}}.
}

\examples{
	library(Nippon)
	jpn <- c(hiragana()[21:25], katakana()[26:30])
	kana2roma(jpn)
}
\keyword{Japanese language}
\keyword{character}
