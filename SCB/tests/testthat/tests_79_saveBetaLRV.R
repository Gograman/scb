saveBetaLRVFunction <- function()
{
  cat ("\n Testing \'tests_79_saveBetaLRV\'\n")
  tParCount <- 10

  sampleSize <- 50

  testUtilSaveBetaLRVToLag2(sampleSize = sampleSize,tParCount = tParCount)


}
test_that("testing saveBetaLRVFunction",
          {
            saveBetaLRVFunction()
            cat(" End of test saveBetaLRVFunction", "\n")
            cat("=========================================")
          })
