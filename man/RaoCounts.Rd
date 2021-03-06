% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rao_index.R
\name{RaoCounts}
\alias{RaoCounts}
\title{Rao-Stirling diversity index based on the counts of cited disciplines.}
\usage{
RaoCounts(counts, similarity)
}
\arguments{
\item{counts}{A vector of counts of citations to different disciplines of a single publication.
The length of the vector should be equal to the total number of disciplines.}

\item{similarity}{A positive semi-definite matrix that encodes the similarity between disciplines, as explained in Porter and Rafols (2009).
The dimensions of this matrix are \emph{n} x \emph{n}, being \emph{n} the total number of disciplines.
The number of rows and the number columns of this matrix need to be equal to the length of \code{counts}.
The self-similarities (i.e. the diagonal elements) have to be 1.}
}
\value{
The Rao-Stirling diversity index of a publication.
}
\description{
This function calculates the Rao-Stirling diversity index of a single publication, based on the count of citations to different disciplines.
Note that this function returns the correct result if a vector of proportions is supplied as input. Since a normalization by (approximately) 1.0 is performed, the result is identical to the result of the function \code{\link{RaoProportions}} up to numerical precision.
}
\references{
Porter, A. and Rafols, I. (2009) Is science becoming more interdisciplinary? Measuring and mapping six research fields over time. Scientometrics, Vol. 81, No. 3 (719-745). DOI:10.1007/s11192-008-2197-2
}
\keyword{internal}
