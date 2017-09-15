createBandsBrickFunction <-
  function(sampleSize = 5,
           lag = 1,
           tParCount = 10,
           bandwidth = 0.5,
           nonCoverageProbability = 0.05,
           replicationCount = 3)
  {
    cat ("\n Testing \'createBandsBrick\'\n")
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

    Start = Sys.time()
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
    End = Sys.time()
    Duration = End - Start
    cat("bandsArray", bandsBrick[1:5])
    cat("\nDuration", Duration, "\n")
  }
test_that("createBandsBrick", {
  createBandsBrickFunction()
  cat("End of test createBandsBrick", "\n")
  cat("=====================")
})
