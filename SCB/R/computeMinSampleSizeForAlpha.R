#' @title ComputeMinSampleSizeForAlpha
#'
#' @name ComputeMinSampleSizeForAlpha
#'
#' @aliases ComputeMinSampleSizeForAlpha
#'
#' @description ComputeMinSampleSizeAlpha
#'
#' @param alpha
#'
#' @return
#'
#' @examples
#'
#'@export

computeMinSampleSizeForAlpha <- function (alpha)
{
  minSampleSize = ceiling (exp (1/2 * (getC_K() - log(log(1 / sqrt(1 - alpha)))))^(-5))
  return (minSampleSize)
}
