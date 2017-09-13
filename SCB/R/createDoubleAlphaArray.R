#' @title createDoubleAlphaArray

#' @name createDoubleAlphaArray
#'
#' @aliases createDoubleAlphaArray
#'
#' @description Create double alpha hat array for every alpha in input array
#'
#' @param superReplicationCount how many times we produced alpha hat.
#' @param replicationCount how many bands we need to generate to form a single alphaHat
#' @param sampleSize size of the sample
#' @param lag lag value.
#' @param lagCount how many lags we consider.
#' @param alphaArray a alpha parametr array
#' @param tParArray a T parameter array
#' @param kernel the Epanechnikov kernel.
#' @param bandwidth a bandwidth value.
#' @return A two dimensional array representing the alpha and many alpha hat for it.
#'
#' @examples
createDoubleAlphaArray = function(superReplicationCount,
                                  replicationCount,
                                  sampleSize,
                                  lag,
                                  lagCount,
                                  alphaArray,
                                  tParArray,
                                  kernel = normalDifferenceKernel,
                                  bandwidth)

{
  alphaCount=length(alphaArray)
  doubleAlphaArray = array(0, dim = c(superReplicationCount, alphaCount))


  for (alphaIndex in 1: alphaCount)
{
    cat("\n Now alpha index =",alphaIndex)
    doubleAlphaArray[, alphaIndex] = computeNonCoverageFreqArray(
      superReplicationCount = superReplicationCount,
      replicationCount = replicationCount,
      sampleSize = sampleSize + alphaIndex,
      lag = lag,
      lagCount = lagCount+alphaIndex,
      tParArray = tParArray,
      kernel = kernel,
      bandwidth = bandwidth,
      nonCoverageProbability = alphaArray[alphaIndex])
  }

  fileName <- paste("ss", sampleSize, "l", lag, "bandW", bandwidth, sep = "_")
  fileName <- paste(fileName, "repC", replicationCount,"SrepC", superReplicationCount, sep = "_")
  saveDoubleAplhaHatArray(nonCoverageProbabilities = alphaArray,
                         alphaHats = doubleAlphaArray,fileName = fileName)

  return(doubleAlphaArray)

}
