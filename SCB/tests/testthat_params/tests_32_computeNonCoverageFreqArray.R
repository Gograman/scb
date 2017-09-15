computeNonCoverageFreqArrayFunction <- function(sampleSize = 5,
                                                lag = 1,
                                                tParCount = 10,
                                                bandwidth = 0.5,
                                                nonCoverageProbability = 0.05,
                                                replicationCount = 3,
                                                superReplicationCount = 4) {
  cat("\n Testing \'computeNonCoverageFreqArray\' \n")

  myTParCount  <-tParCount
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- superReplicationCount
  myReplicationCount <- replicationCount
  mySampleSize <- sampleSize
  myLag <- lag
  myLagCount <- computeLagCount(lag = myLag,sampleSize = mySampleSize)
  myKernel <- normalDifferenceKernel
  myBandwidth <- bandwidth
  myNonCoverageProbability <-nonCoverageProbability
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


  cat("\nDuration= ",Duration)

}

test_that("Testing \'computeNonCoverageFreqArray\'", {
  computeNonCoverageFreqArrayFunction()
  cat("\nEnd of test computeNonCoverageFreqArray", "\n")
  cat("=====================")
})
