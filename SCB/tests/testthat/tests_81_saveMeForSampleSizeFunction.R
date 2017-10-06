saveMeForSampleSizeFunction <- function()
{
  cat ("\n Testing \'tests_81_saveMeForSampleSize\'\n")
  sampleSize <- seq(10,150,by=100)
  tParCount <- 10

  nonCoverageProbability <- 0.2
  lag <- 2
  nMe <- 5

  saveMeForSampleSize(sampleSize = sampleSize,
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
