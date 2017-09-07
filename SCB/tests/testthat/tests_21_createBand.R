createBandFunction <- function()
{
  cat("\n Testing \'createBand\' \n ")
  mySampleSize = 62
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(coefFunction = sin, sampleSize = mySampleSize)



  myLag = 1
  myLagCount = 4
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05
Start=Sys.time()
  band <- createBand(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = myBandwidth,
    kernel = myKernel,
    sampleSize = mySampleSize,
    nonCoverageProbability = myNonCoverageProbability
  )

End=Sys.time()
Duration=End-Start


cat("\nsize of band",length(band))
  cat("\nband1", band)
  cat("\nDuration= ",Duration)

}

test_that("Testing \'createBand\'", {
  createBandFunction()
  cat("\nEnd of test createBand", "\n")
  cat("=====================")
})
