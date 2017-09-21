saveNonCoverageFreqArrayFunction <- function()
{
  cat ("\n Testing \'saveNonCoverageFreqArray\'\n")

  myTParCount  <-10
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 7
  myReplicationCount <- 6
  mySampleSize <- 200
  myLag <- 1
  myLagCount <- computeLagCount(lag = myLag,sampleSize = mySampleSize)
  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  myNonCoverageProbability <- 0.05
Start=Sys.time()
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

  saveNonCoverageFreqArray(nonCoverageProbability = nonCoverageProbability,
                                   alphaHatArray = alphaHatArray, sampleSize = mySampleSize,
                           replicationCount = myReplicationCount, bandwidth = myBandwidth,
                           lag = myLag, superReplicationCount = mySuperReplicationCount)


  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
}

test_that("Testing \'saveNonCoverageFreqArray\'", {
  saveNonCoverageFreqArrayFunction()
  cat("\nEnd of test saveNonCoverageFreqArray", "\n")
  cat("=====================")
})
