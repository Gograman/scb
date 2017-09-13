saveNonCoverageFreqArrayFunction <- function()
{
  cat ("\n Testing \'saveNonCoverageFreqArray\'\n")

  myTParCount  <-10
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 4
  myReplicationCount <- 10
  mySampleSize <- 170
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

  myfileName <- paste("ss", mySampleSize, "l", myLag, "bandW", myBandwidth, "alpha"
                    , myNonCoverageProbability, sep = "_")

  fileName1 <- paste(myfileName, "repC", myReplicationCount, sep = "_")
  saveNonCoverageFreqArray(nonCoverageProbability = nonCoverageProbability,
                                   alphaHatArray = alphaHatArray, fileName = fileName1)


  End=Sys.time()
  Duration=End-Start
  cat("\nDuration",Duration,"\n")
}

test_that("Testing \'saveNonCoverageFreqArray\'", {
  saveNonCoverageFreqArrayFunction()
  cat("\nEnd of test saveNonCoverageFreqArray", "\n")
  cat("=====================")
})
