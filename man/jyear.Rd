\name{jyear}
\alias{jyear}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Convert Japanese year style}
\description{
\code{jyear} calculates a year of the reign of an Emperor, i.e., 
``gengo'', which is
widely used in official statistics and documents in Japan.
}
\usage{
jyear(x, shift = FALSE, withAD = FALSE, ascii = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{numeric. a Cristian year. It must be greater than 1867.}
  \item{shift}{logical. This is for manual adjustment in a particular year. The
		default value is FALSE. See \bold{Details} for more 
		information.}
  \item{withAD}{logical. If TRUE, the intact Christian year is also given in output. The
		default value is FALSE.}
  \item{ascii}{logical. If TRUE, an abbreviation of gengo is used: "M", "T",
		"S", and "H". If FALSE, the Kanji characters of gengo is provided. The default
		value is FALSE.
}
}
\details{
Japan uses era systems, and on each emperor's reign it would constitute one
era. The Japanese traditional era name is widely used in official
statistics and documents instead of the Anno Domini system. Recently,
the year is often written in traditional form with Christian year,
e.g., H12 (2000), because Japanese year style without Christian one is
confusing even for Japanese.

\code{jyear} calculates such Japanese year from the given Christian
year. Is may be useful if the Japanese style is required in statistical
graphics or documents.

Since \code{jyear} dose not take account of month and day, an unexpected
output could be given for a particular year, during which an era changed
to a new one. The \code{shift} option should be set manually as TRUE in the
following period.
\tabular{l}{
	from January 1 to July 29 in 1912\cr
	from January 1 to December 24 in 1926\cr
	from January 1 to 7 in 1989\cr
	}
}
\value{character}

% \references{
% %% ~put references to the literature/web site here ~
% }
\author{Susumu Tanimura \email{aruminat@gmail.com}}

% \note{
% %%  ~~further notes~~
% }

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link[epicalc]{be2ad}}}
\examples{
jyear(2000,ascii=TRUE)
jyear(2000,withAD=TRUE,ascii=TRUE)
jyear(1989,ascii=TRUE)
jyear(1989,shift=TRUE,ascii=TRUE)
}
\keyword{Japanese}
\keyword{manip}% __ONLY ONE__ keyword per line
