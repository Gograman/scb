saveBandFuction <- function()
{
  cat ("\n Testing \'SaveBand\'\n")

  mySampleSize = 10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  myLag = 1
  myLagCount = computeLagCount(lag = myLag,sampleSize = mySampleSize)
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05

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


  cat("\nFileName= ", myfileName)
  Start = Sys.time()
  saveBand(band = band,
           corArray = corArray,
           fileName = myfileName)
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
