computeNonCoverageFreqArrayFunction <- function() {
  cat("\n Testing \'computeNonCoverageFreqArray\' \n")

  myTParCount  <-5
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 7
  myReplicationCount <- 6
  mySampleSize <- 13
  myLag <- 5
  myLagCount <- computeLagCount(lag = myLag,sampleSize = mySampleSize)
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
    nonCoverageProbability = myNonCoverageProbability,
    fileName = "tests_64_computeNonCoverageFreqArray"
  )
  End=Sys.time()
  Duration=End-Start
cat("\n NonCoverageFreqArray= ",nonCoverageFreqArray)

  cat("\nDuration= ",Duration)

}

test_that("Testing \'computeNonCoverageFreqArray\'", {
  computeNonCoverageFreqArrayFunction()
  cat("\nEnd of test computeNonCoverageFreqArray", "\n")
  cat("=====================")
})
