computeIsCoveredFunction = function()
{
  cat ("\n Testing \'computeIsCovered\'\n")

  mySampleSize = 100
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(sampleSize = mySampleSize)
  myReplicationCount=5
  mySuperReplicationCount <- 3
  myCoefFunction=sin

  myLag = 2

  myLagCount =computeLagCount(lag = myLag,sampleSize = mySampleSize)
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05
  fileName <- paste("ss", mySampleSize, "l", myLag, "bandW", myBandwidth, "alpha"
                    , myNonCoverageProbability, sep = "_")
  mockBand = createBand(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = myBandwidth,
    kernel = myKernel,
    sampleSize = mySampleSize,
    nonCoverageProbability = myNonCoverageProbability
  )

  mockTVMA1CoefArray <- createTVMA1CoefArray(sampleSize = mySampleSize)

  mockCor <- computeCor(lag = myLag,tParArray = mockTParArray)

Start=Sys.time()
  isCovered <- computeIsCovered(mockBand,
                                mockCor,
                                sampleSize = mySampleSize,
                                bandwidth = myBandwidth,
                                lag = myLag,
                                replicationCount = myReplicationCount,
                                superReplicationCount = mySuperReplicationCount,
                                nonCoverageProbability = myNonCoverageProbability,
                                fileName = "test_61_computeIsCovered")
  End=Sys.time()
  Duration=End-Start


  cat("\nIsCovered:",isCovered, "\n")
  cat("Duration",Duration,"\n")
}

test_that("Testing computeIsCovered", {
  computeIsCoveredFunction()
  cat("End of test computeIsCovered","\n")
  cat("=====================")
})
