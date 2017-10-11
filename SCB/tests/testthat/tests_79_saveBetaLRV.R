saveBetaLRVFunction <- function()
{
  cat ("\n Testing \'tests_79_saveBetaLRV\'\n")
  tParCount <- 10



  sampleSize <- computeMinSampleSizeForBandwidth()
  nBetaLrvHat <- 5

  testUtilSaveBetaLRVToLag2(sampleSize = sampleSize,tParCount = tParCount,nBetaLrvHat = nBetaLrvHat)





}
test_that("testing saveBetaLRVFunction",
          {
            saveBetaLRVFunction()
            cat(" End of test saveBetaLRVFunction", "\n")
            cat("=========================================")
          })
