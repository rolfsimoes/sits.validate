% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarizeByPolygons.R
\name{summarizeOneBySimU}
\alias{summarizeOneBySimU}
\title{Summarize the classification areas in each Brazilian simulation units.}
\usage{
summarizeOneBySimU(data, progress = TRUE)
}
\arguments{
\item{data}{A raster::raster data.}

\item{progress}{A boolean value indicating whether this function should print its progress. Default is true.}
}
\description{
This function returns the area of each class within
each Brazilian municipality. The output is a data.frame with the
same row names (classes) and municipalities as columns. It uses file
Dropbox/sits.validate/shapes/55mu2500gsd_removednull.shp, with 18,194 simulation units.
}
\author{
Pedro R. Andrade, \email{pedro.andrade@inpe.br}
}
