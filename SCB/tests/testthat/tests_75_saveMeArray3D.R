saveMe3DForAlphaFunction <- function()
{
  cat ("\n Testing \'tests_75_saveMe3DForAlpha\'\n")
  alphas <- seq(0.01,0.05)
    maxAlpha <- max(alphas)
  sampleSize <- computeMinSampleSize(maxAlpha)

  tParCount <- 8


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
