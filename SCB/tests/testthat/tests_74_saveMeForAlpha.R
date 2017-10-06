saveMeForAlphaFunction <- function()
{
  cat ("\n Testing \'tests_74_saveMeForAlpha\'\n")
  sampleSize <- 10
  sample <- createSample(sampleSize = sampleSize)

  nMe <- 5

  nonCoverageProbability <- 0.1

  lag <- 2


  tParCount <- 10
  errorIfNotInputCompatible(alpha = nonCoverageProbability,
                            lag = lag,sampleSize = sampleSize)

  saveMeForAlpha(sampleSize = sampleSize,
                 sample = sample,
                 nME = nMe,
                 nonCoverageProbability = nonCoverageProbability,
                 lag = lag,
                 tParCount = tParCount)
}


test_that("testing saveMeForAlpha",{


  saveMeForAlphaFunction()
  cat(" End of test saveMeForAlphaFunction", "\n")
  cat("=========================================")
})
