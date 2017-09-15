saveNonCoverageFreqArrayFunction <- function(sampleSize = 5,
                                             lag = 1,
                                             tParCount = 10,
                                             bandwidth = 0.5,
                                             nonCoverageProbability = 0.05,
                                             replicationCount = 3,
                                             superReplicationCount = 4)
{
  cat ("\n Testing \'saveNonCoverageFreqArray\'\n")

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
  myNonCoverageProbability <- nonCoverageProbability
  Start = Sys.time()
  nonCoverageFreqArray = computeNonCoverageFreqArray(
    superReplicationCount = mySuperReplicationCount,
    replicationCount = myReplicationCount,
    sampleSize = mySampleSize,
    lag = myLag,
    lagCount = myLagCount,
    tParArray = myTParArray,
    kernel = myKernel,
    bandwidth = myBandwidth,
    nonCoverageProbability = myNonCoverageProbability
  )

  nonCoverageProbability <- myNonCoverageProbability
  alphaHatArray <- nonCoverageFreqArray

  myfileName <-
    paste(
      "ss",
      mySampleSize,
      "l",
      myLag,
      "bandW",
      myBandwidth,
      "alpha"
      ,
      myNonCoverageProbability,
      sep = "_"
    )

  fileName1 <-
    paste(myfileName, "repC", myReplicationCount, sep = "_")
  saveNonCoverageFreqArray(
    nonCoverageProbability = nonCoverageProbability,
    alphaHatArray = alphaHatArray,
    sampleSize = mySampleSize,
    bandwidth = myBandwidth,
    replicationCount = myReplicationCount,
    lag = myLag,
    superReplicationCount = mySuperReplicationCount
  )

  End = Sys.time()
  Duration = End - Start
  cat("\nDuration", Duration, "\n")
}

test_that("Testing \'saveNonCoverageFreqArray\'", {
  saveNonCoverageFreqArrayFunction()
  cat("\nEnd of test saveNonCoverageFreqArray", "\n")
  cat("=====================")
})
