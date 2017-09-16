saveDoubleAplhaHatArrayFunction <- function()
{
  cat ("\n Testing \'saveDoubleAplhaHatArray\'\n")
  myTParCount  <- 15
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 6
  myReplicationCount <- 7
  mySampleSize <- 10
  myLag <- 1
  myLagCount <- computeLagCount(lag = myLag,sampleSize = mySampleSize)

  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  nonCoverageProbabilities <- c(0.2,0.4,0.6,0.8)

  alphaHats<-createDoubleAlphaArray(superReplicationCount = mySuperReplicationCount,
                         replicationCount = myReplicationCount,
                         sampleSize = mySampleSize,
                         lag = myLag, lagCount = myLagCount,
                         alphaArray = nonCoverageProbabilities,
                         tParArray = myTParArray,
                         kernel = myKernel,
                         bandwidth = myBandwidth)

   saveDoubleAplhaHatArray(nonCoverageProbabilities = nonCoverageProbabilities,
                          alphaHats = alphaHats, sampleSize = mySampleSize,
                          lag = myLag, replicationCount = myReplicationCount,
                          superReplicationCount = mySuperReplicationCount,
                          bandwidth = myBandwidth)
 }
test_that("Testing \'saveNonCoverageFreqArray\'", {
  saveDoubleAplhaHatArrayFunction()
  cat("\nEnd of test saveNonCoverageFreqArray", "\n")
  cat("=====================")
})

