computeIsCoveredArrayFunction <- function(sampleSize = 5,
                                          lag = 1,
                                          tParCount = 10,
                                          bandwidth = 0.5,
                                          nonCoverageProbability = 0.05,
                                          replicationCount = 3,
                                          superReplicationCount = 4)
{
  cat("\n Testing \'computeIsCoveredArray\'\n")

  mySampleSize = sampleSize
  myTParCount = tParCount
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(sampleSize = mySampleSize)
  myReplicationCount = replicationCount
  myLag = lag
  myLagCount = computeLagCount(lag = myLag, sampleSize = mySampleSize)
  myKernel = normalDifferenceKernel
  myBandwidth = bandwidth
  myNonCoverageProbability = nonCoverageProbability
  mySuperReplicationCount = superReplicationCount

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
  bandsBrick = createBandsBrick(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = myBandwidth,
    kernel = normalDifferenceKernel,
    sampleSize = mySampleSize,
    nonCoverageProbability = myNonCoverageProbability,
    replicationCount = myReplicationCount
  )
  mockCorArray <- computeCor(lag = myLag, tParArray = mockTParArray)


  Start = Sys.time()
  isCoveredArray <-
    computeIsCoveredArray(
      bandsBrick = bandsBrick,
      corArray = mockCorArray,
      sampleSize = mySampleSize,
      bandwidth = myBandwidth,
      replicationCount = myReplicationCount,
      lag = myLag,
      superReplicationCount = mySuperReplicationCount
    )
  End = Sys.time()
  Duration = End - Start

  # expect(5 == 5)
  cat("isCoveredArray: ", isCoveredArray)
  cat("\nDuration= ", Duration, "\n")




}

test_that("Testing \'isCoveredArray\'", {
  computeIsCoveredArrayFunction()
  cat("End of test isCoveredArray", "\n")
  cat("=====================")
})
