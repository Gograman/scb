saveCorAndCorHatFunction <- function()
{
  cat ("\n Testing \'tests_80_saveCorAndCorHat\'\n")
  sampleSize <- 100
  tParCount <- 10



  lag <- 1

  nCorHat <- 5

  saveCorAndCorHat(sampleSize = sampleSize,
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

