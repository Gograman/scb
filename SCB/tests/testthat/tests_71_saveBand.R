saveBandFuction <- function()
{
  cat ("\n Testing \'SaveBand\'\n")

  mySampleSize = 10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  myLag = 2
  myLagCount = computeLagCount(lag = myLag,sampleSize = mySampleSize)
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.025
  mySuperReplicationCount <- 3
  myReplicationCount <- 2

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



  Start = Sys.time()
  saveBand(band = band,
           corArray = corArray, sampleSize = mySampleSize, lag = myLag,
           replicationCount = myReplicationCount, bandwidth = myBandwidth,
           superReplicationCount = mySuperReplicationCount)
  End = Sys.time()
  Duration = End - Start
  cat("\nDuration= ",Duration, "\n")



}

test_that("Testing saveBand",
          {
            saveBandFuction()
            cat(" End of test saveBand", "\n")
            cat("=====================")
          })
