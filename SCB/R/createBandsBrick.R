#' @title createBandsArray

#' @name createBandsArray
#'
#' @aliases createBands
#'
#' @description Create a three-dimensional array of confidence intervals bands of size c(replicationCount, sampleSize, 2).
#'
#' @param nonCoverageProbability the probability of non-covering the real values with the estimated ones. \code{alpha = 0.05} by default.
#'
#' @return A two dimensional vector representing the lower and the upper bound of CI.
#'
#' @examples
#'mySampleSize=40
#'myTParCount = 2
#'mockTParArray <- createTParArray(tParCount = myTParCount)
# may be different
#'mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)
#'myReplicationCount=5
#'myLag = 1
#'myLagCount = 4
#'myKernel = normalDifferenceKernel
#'myBandwidth = 0.5
#'myNonCoverageProbability=0.05
#'bandsBrick=createBandsBrick(tParArray=mockTParArray,
#'                            lag=myLag,
#'                            lagCount=myLagCount,
#'                           bandwidth= myBandwidth,
#'                           kernel = normalDifferenceKernel,
#'                            sampleSize=mySampleSize,
#'                            nonCoverageProbability = myNonCoverageProbability,
#'                            replicationCount=myReplicationCount)
#'

createBandsBrick <- function(tParArray,
                             lag,
                             lagCount,
                             bandwidth,
                             kernel = normalDifferenceKernel,
                             sampleSize,
                             nonCoverageProbability = 0.05,
                             replicationCount)
{
  # generate replicationCount of samples
  # for each sample, create a band
  # pack those bands together into a brick
  # return that brick
  tParCount=length(tParArray)
  bandsArray <- array(0, dim = c(replicationCount,tParCount, 2))

  for (repCountIndex in 1:replicationCount)
  {

    bandsArray[repCountIndex, ,] <-
      createBand(
        tParArray = tParArray,
        lag = lag,
        lagCount = lagCount,
        bandwidth = bandwidth,
        kernel = kernel,
        sampleSize = sampleSize,
        nonCoverageProbability = nonCoverageProbability
      )

  }

  bandsArray
}
