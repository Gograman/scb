saveMe3DForAlphaFunction <- function()
{
  cat ("\n Testing \'tests_75_saveMe3DForAlpha\'\n")
  maxAlpha <- 0.9
  sampleSize <- computeMinSampleSize(maxAlpha)

  tParCount <- 8

  alphas <- seq(0.1,0.9,by = 0.1)

  lag <- 2

  testUtilsaveMe3DForAlpha(sampleSize = sampleSize,
                                     tParCount = tParCount,
                                     alphas = alphas,
                                     lag = lag)




}
test_that("testing saveMe3DForAlpha",
          {
            saveMe3DForAlphaFunction()
            cat(" End of test saveMe3DForAlphaFunction", "\n")
            cat("=========================================")
          })
