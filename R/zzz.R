#' knnsmoother
#' 
#' This is the R implementation of the algorithm based on KNN to smooth
#' scRNA-Seq data, with the goal of significantly improving the signal-to-noise
#' ratio of each profile, while largely preserving biological expression
#' heterogeneity. The algorithm is based on the observation that across
#' platforms, the technical noise exhibited by UMI-filtered scRNA-Seq data
#' closely follows Poisson statistics. Smoothing is performed by first
#' identifying the nearest neighbors of each cell in a step-wise fashion, based
#' on variance-stabilized and partially smoothed expression profiles, and then
#' aggregating their UMI counts. See publication: "K-nearest neighbor smoothing
#' for high-throughput single-cell RNA-Seq data" (Florian Wagner, Yun Yan, Itai
#' Yanai, bioRxiv 217737; doi: https://doi.org/10.1101/217737).
#' 
#' @docType package
#' @author Yun Yan <yun.yan@nyumc.org>
#' @import Rcpp RcppArmadillo Matrix magrittr
#' @importFrom Rcpp evalCpp
#' @useDynLib knnsmoother
#' @name knnsmoother
NULL 