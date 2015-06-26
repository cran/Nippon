\name{JapanPrefecturesMap}
\alias{JapanPrefecturesMap}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{A simple choropleth map of Japan}
\description{
	Draw a very simple choropleth map of Japan with prefecture boundaries
}
\usage{
JapanPrefecturesMap(col = NULL, inset = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{col}{
		A character vector. RGB or named colors in order of JISCODE to fill a
		polygon of 47 prefectures.
	}
	\item{inset}{logical. if TRUE, Okinawa Prefecture is shown in a inset
		map. The default value is TRUE.}
	\item{...}{any other options passed to plot method of SpatialPolygons class.}
}

\details{

	The function \code{JapanPrefecturesMap} draws a simple choropleth map of
Japan in prefecture level with or without inset of Okinawa
Prefecture. This feature is most frequently desired by Japanese R users
but has been difficult to draw with R functions, for example,
\code{map('japan')} in \pkg{mapdata} package.  What is important is that
this function receives a color vector in order of JIS code of
prefectures. Since most official statistics by prefecture is in order of
the JIS code, users simply create a color sequence for a choropleth map
without any rearranging the order. Users are now freed from a trouble in
applying \code{order} or \code{merge} functions to their data set.

Population set was retrieved from 2010 Population Census of Japan.

}

\value{
A matrix. The coordinates of a label point in each prefecture.
}
%% \references{
%%         Halfwidth and Fullwidth Forms
%%         \url{http://www.alanwood.net/unicode/halfwidth_and_fullwidth_forms.html}
%% }
\author{
Susumu Tanimura \email{aruminat@gmail.com}
}
\note{
  For the sake of simple visualization, prefecture boundaries are lacking
  accuracy; assisted by Quantum GIS (\url{http://www.qgis.org/}), the
  author drew by hand the boundaries omitting minor islands. Therefore,
  users should not use the map for calculating area or measuring a distance.
}
%% ~Make other sections like Warning with \section{Warning }{....} ~
\seealso{%
  \code{\link[cshapes:cshp]{cshp}} in \pkg{cshapes} package,
  \code{\link[mapdata:japan]{japan}} in \pkg{mapdata} package.
}

\examples{
if (require(RColorBrewer)) {
  cols <- rev(brewer.pal(8,"Set2"))
}else{
  cols <- gray.colors(8)
}
JapanPrefecturesMap(col = cols, axes = TRUE)

require(foreign)
dat <- read.dbf(system.file("shapes/jpn.dbf", package="Nippon"))
op <- par(bg = "skyblue")
p <- JapanPrefecturesMap(col = "ivory")
col <- c("olivedrab4", "olivedrab1")
pop <- dat$population / 1e+7
symbols(p, circles = sqrt(pop / (2 * pi)), inches = FALSE,
    fg = col[1], bg = col[2], add = TRUE)
idx <- c(1e+6, 5e+6, 1e+7)
pos <- legend("bottomright", legend = format(idx, scientific = 10, big.mark = ","),
    title = "Population (2010)", bg = "white", x.intersp = 2, y.intersp = 1.5)
symbols(pos$text$x - 1, pos$text$y, circles = sqrt(idx / 1e+7 / (2 * pi)),
    inches = FALSE, fg = col[1], bg = col[2], add = TRUE)
par(op)

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{character}
\keyword{Japanese language}
% __ONLY ONE__ keyword per line
