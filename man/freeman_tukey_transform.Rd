% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{freeman_tukey_transform}
\alias{freeman_tukey_transform}
\title{Freeman-Tukey transformation on a matrix}
\usage{
freeman_tukey_transform(X)
}
\arguments{
\item{X}{A matrix in a shape of #genes x #samples.}
}
\value{
A matrix in a same shape of \code{X} with freeman tukey
transformation performed.
}
\description{
\code{sqrt(X) + sqrt(X + 1)}
}
