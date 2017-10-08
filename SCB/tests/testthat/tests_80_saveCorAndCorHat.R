saveCorAndCorHatFunction <- function()
{
  cat ("\n Testing \'tests_80_saveCorAndCorHat\'\n")
  alpha <- 0.1
  sampleSize <- computeMinSampleSize(alpha)
  tParCount <- 10



  lag <- 1
  errorIfNotInputCompatible(alpha, lag = lag,sampleSize = sampleSize)

  nCorHat <- 5

  testUtilSaveCorAndCorHat(sampleSize = sampleSize,
                   tParCount = tParCount,
                   lag = lag,
                   nCorHat = nCorHat)

}
test_that("testing saveCorAndCorHatFunction",
          {
            saveCorAndCorHatFunction()
            cat(" End of test saveCorAndCorHatFunction", "\n")
            cat("=========================================")
          })

