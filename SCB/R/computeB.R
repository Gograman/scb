#' @title computeB
#'
#' @name computeB
#'
#' @aliases createB
#'
#' @description Create \code{b}, a.k.a. bandwidth given \code{n} as being a sample size
#'
#' @param n the sample size
#'
#' @return A scalar value of \code{b}.
#'
#' @examples bandwidthValue <- computeB(n = 8)
#'@export

computeB <- function (sampleSize) {
  b <- sampleSize ^ (-0.2)
}
