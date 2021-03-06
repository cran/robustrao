% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/call_indices.R
\name{ParallelBoundIndices}
\alias{ParallelBoundIndices}
\title{Parallel computation of the lower/upper bounds of the uncertainty interval of the Rao-Stirling diversity index.}
\usage{
ParallelBoundIndices(bound, count.matrix, uncat.refs, similarity,
  pruning = TRUE, tolerance = 1, redistribution.limit = 4, threads = 1,
  max.batch.size = 131072)
}
\arguments{
\item{bound}{String that indicates which index to compute.
Two values are valid: \emph{upper} and \emph{lower}.}

\item{count.matrix}{Vector or matrix that contains the counts of references to different disciplines of a single publication (a vector) or of several publications (a matrix).
If it is a vector its length is equal to the total number of disciplines.
In case it is a matrix its dimensions are \emph{n} x \emph{m}, being n the total number of disciplines and m the number of publications for which the lower/upper bound will be computed.}

\item{uncat.refs}{Number of uncategorized references of a publication (a number) or several publications (a vector).}

\item{similarity}{A positive semi-definite matrix that encodes the similarity between disciplines, as explain in Porter and Rafols (2009).
The dimensions of this matrix are \emph{n} x \emph{n}, being \emph{n} the total number of disciplines.
The self-similarities (i.e. values in the diagonal) have to be 1.}

\item{pruning}{Logical value that indicates whether the set of permissible disciplines will be calculated and used to avoid improbable redistributions of disciplines.
This argument is optional and leaving it unspecified ignores the pruning of unlikely disciplines in the redistribution.}

\item{tolerance}{A real number in the interval [0,1].
This argument modulates the similarity between disciplines with which the strictness of the pruning of unlikely disciplines is controlled.
A value of 0 allows all disciplines to participate in the redistribution process.
A value of 1 permits no tolerance.
This argument is optional and leaving it unspecified deactivates tolerances.}

\item{redistribution.limit}{A positive integer that limits the number of disciplines that each uncategorized reference can have redistributed.
This argument is optional and leaving it unspecified will set the redistribution.limit to default.}

\item{threads}{A positive number that specifies the number of parallel threads that will be executed.
This argument should be set according to the number of processor core in the CPU of the user.
This argument is optional and leaving it unspecified will set the number of threads to default.}

\item{max.batch.size}{A positive integer that sets the size of the batch of candidates that is computed at once.
This positive value determines the quantity of allocated memory and has to be reduced if corresponding errors arise.
This argument is optional and leaving it unspecified sets it to a default value.}
}
\value{
The lower or the upper bound/s of the uncertainty interval of the Rao-Stirling index of one publication (an integer) or several publications (a vector).
}
\description{
This function allows the computation of the lower/upper bounds of the uncertainty interval of the Rao-Stirling index (Calatrava et al., 2016) in parallel threads.
It includes the parallel computation of the permissible disciplines (i.e., function \code{\link{PruneDisciplines}}).
The use of this function is recommended for an efficient computation of the lower and upper bounds of the uncertainty interval of the Rao-Stirling index.
The computation of the lower bound is an NP-hard problem.
Because the computation of the lower bound might require long computing times, this function creates a log file 'parallel-bounds-log.txt' in the user's workspace.
The content of the log file is written during the execution of the function and indicates number of publications that have been processed.
}
\section{Warning}{

This function solves a computationally intensive optimization problem. In order to reduce the search space it is recommended to provide the function with the vector of permissible disciplines and redistribution limit.
}

\examples{
#Load data
data(pubdata1)

#Get upper bound indices of the uncertainty interval of the Rao-Stirling diversity index.
ParallelBoundIndices("upper", pd1.count.matrix, pd1.uncat.refs, pd1.similarity, TRUE, 0.233, 4, 2)

#Get lower bound indices of the uncertainty interval of the Rao-Stirling diversity index.
ParallelBoundIndices("lower", pd1.count.matrix, pd1.uncat.refs, pd1.similarity, TRUE, 0.233, 4, 2)

#When many references of a publication are uncategorized, a warning message is displayed
#to inform the user. Such cases require longer computation times.

}
\references{
Calatrava Moreno, M. C., Auzinger, T. and Werthner, H. (2016) On the uncertainty of interdisciplinarity measurements due to incomplete bibliographic data. Scientometrics. DOI:10.1007/s11192-016-1842-4

Porter, A. and Rafols, I. (2009) Is science becoming more interdisciplinary? Measuring and mapping six research fields over time. Scientometrics, Vol. 81, No. 3 (719-745). DOI:10.1007/s11192-008-2197-2
}
