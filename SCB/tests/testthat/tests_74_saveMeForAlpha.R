saveMeForAlphaFunction <- function()
{
  cat ("\n Testing \'tests_74_saveMeForAlpha\'\n")
  nonCoverageProbability <- 0.1
  sampleSize <- computeMinSampleSize(nonCoverageProbability)
  sample <- createSample(sampleSize = sampleSize)

  myNMe <- 5
  lag <- 2


  tParCount <- 10
  errorIfNotInputCompatible(alpha = nonCoverageProbability,
                            lag = lag,sampleSize = sampleSize)

  testUtilSaveMeForAlpha(sampleSize = sampleSize,
                 sample = sample,nME = myNMe,

                 nonCoverageProbability = nonCoverageProbability,
                 lag = lag,
                 tParCount = tParCount)
}


test_that("testing saveMeForAlpha",{


  saveMeForAlphaFunction()
  cat(" End of test saveMeForAlphaFunction", "\n")
  cat("=========================================")
})
