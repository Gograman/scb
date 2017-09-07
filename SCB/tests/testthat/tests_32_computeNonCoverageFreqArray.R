computeNonCoverageFreqArrayFunction <- function() {
  cat("\n Testing \'computeNonCoverageFreqArray\' \n")

  myTParCount  <-2
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 4
  myReplicationCount <- 4
  mySampleSize <- 6
  myLag <- 1
  myLagCount <- 4
  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  myNonCoverageProbability <- 0.05
Start=Sys.time()
  nonCoverageFreqArray <- computeNonCoverageFreqArray(
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
  End=Sys.time()
  Duration=End-Start

  cat("nonCoverageArray= ",nonCoverageFreqArray)
  cat("\nDuration= ",Duration)

}

test_that("Testing \'computeNonCoverageFreqArray\'", {
  computeNonCoverageFreqArrayFunction()
  cat("\nEnd of test computeNonCoverageFreqArray", "\n")
  cat("=====================")
})
