saveBandFuction <- function(sampleSize = 5,
                            lag = 1,
                            tParCount = 10,
                            bandwidth = 0.5,
                            nonCoverageProbability = 0.05,
                            replicationCount = 3,
                            superReplicationCount = 4)
{
  cat ("\n Testing \'SaveBand\'\n")

  mySampleSize = sampleSize
  myReplicationCount = replicationCount
  mySuperReplicationCount = superReplicationCount
  myTParCount = tParCount
  mockTParArray <- createTParArray(tParCount = myTParCount)
  myLag = lag
  myLagCount = computeLagCount(lag = myLag, sampleSize = mySampleSize)
  myKernel = normalDifferenceKernel
  myBandwidth = bandwidth
  myNonCoverageProbability = nonCoverageProbability

  corArray <-
    computeCor(lag = myLag,
               tParArray = mockTParArray)
  #samplesize,lag,bandwitdth,nonCoverageProbability - params for file name
  band <- createBand(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = myBandwidth,
    kernel = myKernel,
    sampleSize = mySampleSize,
    nonCoverageProbability = myNonCoverageProbability
  )

  myfileName <-
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
  Start = Sys.time()
  saveBand(
    band = band,
    corArray = corArray,
    sampleSize = mySampleSize,
    bandwidth = bandwidth,
    replicationCount = myReplicationCount,
    lag = myLag,
    superReplicationCount = mySuperReplicationCount

  )
  End = Sys.time()
  Duration = End - Start
  cat("\nDuration= ", Duration, "\n")



}

test_that("Testing saveBand",
          {
            saveBandFuction()
            cat(" End of test saveBand", "\n")
            cat("=====================")
          })
