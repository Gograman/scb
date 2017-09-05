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

  #fileName <- paste("ss", sampleSize, "l", lag, "bandW", bandwidth, sep = "_")
  #fileName <- paste(fileName, "repC", replicationCount,"SrepC", superReplicationCount, sep = "_")
  #saveDoubleAplhaHatArray(nonCoverageProbabilities = alphaArray,
  #                       alphaHats = doubleAlphaArray,fileName = fileName)

  return(doubleAlphaArray)

}
