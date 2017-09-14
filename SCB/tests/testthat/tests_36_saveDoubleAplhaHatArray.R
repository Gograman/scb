saveDoubleAplhaHatArrayFunction <- function()
{
  cat ("\n Testing \'saveDoubleAplhaHatArray\'\n")
  myTParCount  <- 15
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 6
  myReplicationCount <- 7
  mySampleSize <- 60
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

   fileName <- paste("ss", mySampleSize, "l", myLag, "bandW", myBandwidth, "alpha"
                     , sep = "_")
   fileName <- paste(fileName, "repC", myReplicationCount,"SrepC",mySuperReplicationCount, sep = "_")
   saveDoubleAplhaHatArray(nonCoverageProbabilities = nonCoverageProbabilities,
                          alphaHats = alphaHats,fileName = fileName)
 }
test_that("Testing \'saveNonCoverageFreqArray\'", {
  saveDoubleAplhaHatArrayFunction()
  cat("\nEnd of test saveNonCoverageFreqArray", "\n")
  cat("=====================")
})

