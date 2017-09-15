saveDoubleAplhaHatArrayFunction <- function(sampleSize = 5,
                                            lag = 1,
                                            tParCount = 10,
                                            bandwidth = 0.5,
                                            nonCoverageProbability = 0.05,
                                            replicationCount = 3,
                                            superReplicationCount = 4)
{
  cat ("\n Testing \'saveDoubleAplhaHatArray\'\n")
  myTParCount  <- tParCount
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- superReplicationCount
  myReplicationCount <- replicationCount
  mySampleSize <- sampleSize
  myLag <- lag
  myLagCount <-
    computeLagCount(lag = myLag, sampleSize = mySampleSize)

  myKernel <- normalDifferenceKernel
  myBandwidth <- bandwidth
  nonCoverageProbabilities <- c(0.2, 0.4, 0.6, 0.8)

  alphaHats <-
    createDoubleAlphaArray(
      superReplicationCount = mySuperReplicationCount,
      replicationCount = myReplicationCount,
      sampleSize = mySampleSize,
      lag = myLag,
      lagCount = myLagCount,
      alphaArray = nonCoverageProbabilities,
      tParArray = myTParArray,
      kernel = myKernel,
      bandwidth = myBandwidth
    )

  fileName <-
    paste(
      "ss",
      mySampleSize,
      "l",
      myLag,
      "bandW",
      myBandwidth,
      "alpha"
      ,
      nonCoverageProbabilities,
      sep = "_"
    )
  fileName <-
    paste(fileName,
          "repC",
          myReplicationCount,
          "SrepC",
          mySuperReplicationCount,
          sep = "_")
  saveDoubleAplhaHatArray(
    nonCoverageProbabilities = nonCoverageProbabilities,
    alphaHats = alphaHats,
    sampleSize = mySampleSize,
    lag = myLag,
    replicationCount = myReplicationCount,
    superReplicationCount = mySampleSize,
    bandwidth = myBandwidth
  )
}
test_that("Testing \'saveNonCoverageFreqArray\'", {
  saveDoubleAplhaHatArrayFunction()
  cat("\nEnd of test saveNonCoverageFreqArray", "\n")
  cat("=====================")
})
