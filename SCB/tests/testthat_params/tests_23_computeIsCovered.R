computeIsCoveredFunction = function(sampleSize = 5,
                                    lag = 1,
                                    tParCount = 10,
                                    bandwidth = 0.5,
                                    nonCoverageProbability = 0.05,
                                    replicationCount = 3,
                                    superReplicationCount = 4)
{
  cat ("\n Testing \'computeIsCovered\'\n")

  mySampleSize = sampleSize
  myTParCount = tParCount
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(sampleSize = mySampleSize)
  myreplicationCount = replicationCount
  mySuperReplicationsCount = superReplicationCount
  myCoefFunction = sin

  myLag = lag

  myLagCount = computeLagCount(lag = myLag, sampleSize = mySampleSize)
  myKernel = normalDifferenceKernel
  myBandwidth = bandwidth
  myNonCoverageProbability = nonCoverageProbability
  fileName <-
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
  mockBand = createBand(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = myBandwidth,
    kernel = myKernel,
    sampleSize = mySampleSize,
    nonCoverageProbability = myNonCoverageProbability
  )

  mockTVMA1CoefArray <-
    createTVMA1CoefArray(sampleSize = mySampleSize)

  mockCor <- computeCor(lag = myLag, tParArray = mockTParArray)

  Start = Sys.time()
  isCovered <-
    computeIsCovered(
      mockBand,
      sampleSize = mySampleSize,
      bandwidth = myBandwidth,
      replicationCount = myreplicationCount,
      superReplicationCount = mySuperReplicationsCount,lag=myLag,
      mockCor
    )
  End = Sys.time()
  Duration = End - Start


  cat("\nIsCovered:", isCovered, "\n")
  cat("Duration", Duration, "\n")
}

test_that("Testing computeIsCovered", {
  computeIsCoveredFunction()
  cat("End of test computeIsCovered", "\n")
  cat("=====================")
})
