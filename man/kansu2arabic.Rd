\name{kansu2arabic}
\alias{kansu2arabic}
\alias{kansuExample}
\title{Conversion form Kasuji (Chinese/Japanese numerals) to arabic forms}

\description{
      A function to convert from Kasuji (Chinese/Japanese numerals) to arabic forms. 
}

\usage{
kansu2arabic(s)
kansuExample()
}
\arguments{
  \item{s}{A character vector composed of Kansu characters}
}

\details{Some numeric data (e.g., year) in Japan is written with
	``Kansu'' characters (or ``Kansuji'') instead of using Arabic numeral
	systems. ``Kansu'' is the traditional Japanese numeral systems
	adopting Chinese characters. To make such traditional numerals
	manipulatable, \code{kansu2arabic()} convert them to safe numeric
	forms (i.e., Arabic numerals). The variant of ``Kansu'' characters for
	financial is also acceptable in \code{kansu2arabic()}, though the
	function dose not accept any other characters than ``Kansu''
	characters.

	\code{kansuExample()} merely generates an example of Kansu character
	vector in order to illustrate how \code{kansu2arabic()} works. This
	way is a detour to follow the rule of CRAN that prohibits to write
	non-ASCII characters in package source files.  }

\value{
A numeric vector
}

\author{
Susumu Tanimura \email{aruminat@gmail.com}
}
\note{
	\code{kansu2arabic()} accepts only Kansu characters. Any other
	characters cause errors.
}

%\seealso{}

\examples{
x <-  kansuExample()
x
kansu2arabic(x)
}

\keyword{Japanese language}
\keyword{character}

