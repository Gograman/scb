#' @title createBand

#' @name createBand
#'
#' @aliases createConfidenceBand
#'
#' @description Create a confidence intervals band.
#'
#' @param lag lag value.
#' @param sample a vector of \code{sample}.
#' @param corArray a vector of \code{corArray}.
#' @param bandwidth a kernel bandwidth value.
#' @param nonCoverageProbability the probability of non-covering the real values with the estimated ones. \code{alpha = 0.05} by default.
#'
#' @return A two dimensional vector representing the lower and the upper bound of CI.
#'
#' @examples
#'  myLag = 1
#'myLagCount = 4
#'myKernel = normalDifferenceKernel
#'myBandwidth = 0.5
#'myNonCoverageProbability = 0.05
#'Start=Sys.time()
#'mySample <- createSample(sampleSize = mySampleSize)
#'  band <- createBand(
tParArray = mockTParArray,
lag = myLag,
lagCount = myLagCount,
bandwidth = myBandwidth,
kernel = myKernel,
sampleSize = mySampleSize,
nonCoverageProbability = myNonCoverageProbability)

createBand <- function(tParArray,
                       lag,
                       lagCount,
                       bandwidth,
                       kernel = normalDifferenceKernel,
                       sampleSize,
                       nonCoverageProbability)
{
  # get the real correlation computeCor
  # call ME (sample, bandwidth, nonCoverageProbability)
  # upper = corArray + ME
  # upper = corArray + ME

  mySample <- createSample(sampleSize = sampleSize)

  mockallCorHat = computeAllCorHats(
    tParArray = tParArray,
    lagCount = lagCount,
    sample = mySample,
    kernel = kernel,
    bandwidth = bandwidth

  )

  meByCovHat <- computeMEbyCovHat(
    tParArray = tParArray,
    lag = lag,
    lagCount = lagCount,
    sample = mySample,
    bandwidth = 0.5,
    nonCoverageProbability = nonCoverageProbability,
    allCorHats = mockallCorHat,
    C_K = -1.978325,
    PHI_K_NORMAL_DIFF = 0.4065)

  corHat = computeCorHat(
    tParArray = tParArray,
    lag = lag,
    sample = mySample,
    kernel = kernel,
    bandwidth = bandwidth
  )

  myfileName <-
    paste(
      "ss",
      sampleSize,
      "l",
      lag,
      "bandW",
      bandwidth,
      "alpha"
      ,
      nonCoverageProbability,
      sep = "_"
  )
  lowerBound <- corHat - meByCovHat
  upperBound <- corHat + meByCovHat
  band <- cbind(lowerBound, upperBound)
  # saveBand(corArray = corArray,band =band,fileName = myfileName )
  return(band)


}
