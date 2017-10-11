saveMeForSampleSizeFunction <- function()
{
  cat ("\n Testing \'tests_81_saveMeForSampleSize\'\n")

  tParCount <- 10

  nonCoverageProbability <- 0.2
  minSampleSize <- computeMinSampleSize(nonCoverageProbability)
  maxSampleSize <- minSampleSize + 150
  sampleSize <- seq(minSampleSize,maxSampleSize,by=100)
  lag <- 2
  nMe <- 5

  testUtilSaveMeForSampleSize(sampleSize = sampleSize,
                              tParCount = tParCount,
                              nonCoverageProbability = nonCoverageProbability,
                              lag = lag,
                              nMe = nMe)

}
test_that("testing saveMeForSampleSizeFunction",{


  saveMeForSampleSizeFunction()
  cat(" End of test saveMeForSampleSizeFunction", "\n")
  cat("=========================================")
})
