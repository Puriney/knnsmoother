% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{knn_smoothing}
\alias{knn_smoothing}
\title{Perform KNN-smoothing on UMI-filtered scRNA-seq data}
\usage{
knn_smoothing(X, k = 5L, verbose = 0L)
}
\arguments{
\item{X}{A matrix in a shape of #genes x #samples.}

\item{k}{An integer to choose \code{k} nearest samples (self-inclusive) to
aggregate based on the distance matrix \code{Dr}. If \code{k} is greater than
#samples, \code{k} is forced to be #samples to continue aggregation.}

\item{verbose}{An integer to specify verbose level.}
}
\value{
An aggregated matrix in a same shape of \code{X}.
}
\description{
Perform KNN-smoothing on UMI-filtered scRNA-seq data
}
\references{
"K-nearest neighbor smoothing for high-throughput single-cell
  RNA-Seq data" (Florian Wagner, Yun Yan, Itai Yanai, bioRxiv 217737; doi:
  \url{https://doi.org/10.1101/217737}).
}
