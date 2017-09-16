createBandFunction <- function()
{
  cat("\n Testing \'createBand\' \n ")
  mySampleSize = 61
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(sampleSize = mySampleSize)



  myLag = 1
  myLagCount = computeLagCount(lag = myLag, sampleSize = mySampleSize)
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05
  Start = Sys.time()
  mySample <- createSample(sampleSize = mySampleSize)
  band = createBand(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = myBandwidth,
    kernel = myKernel,
    sampleSize = mySampleSize,
    nonCoverageProbability = myNonCoverageProbability
  )
  End = Sys.time()
  Duration = End - Start



  cat("\nband1", band)
  cat("\nDuration= ", Duration)

}

test_that("Testing \'createBand\'", {
  createBandFunction()
  cat("\nEnd of test createBand", "\n")
  cat("=====================")
})
