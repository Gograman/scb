saveNonCoverageFreqArrayFunction <- function()
{
  cat ("\n Testing \'saveNonCoverageFreqArray\'\n")

  myTParCount  <-2
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 4
  myReplicationCount <- 4
  mySampleSize <- 50
  myLag <- 1
  myLagCount <- 4
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
cat("fileName: ",fileName1)
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
