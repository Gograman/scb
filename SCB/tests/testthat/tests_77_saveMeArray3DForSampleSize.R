if(!require("lattice")) {
  install.packages("lattice")
  library(lattice)
}

saveMe3DForSampleSizeFunction <- function()
{
  cat ("\n Testing \'tests_77_saveMe3DForSampleSize\'\n")
  alphas <- c(0.01,0.05)
  sampleSize <- seq(computeMinSampleSizeForBandwidth(), 100,by = 50)

  tParCount <- 10


  lag <- 2
  testUtilSaveMe3DForSampleSize(sampleSize = sampleSize,
                                alphas = alphas,
                                tParCount = tParCount,
                                lag = lag)


}
test_that("testing saveMe3DForSampleSize",
          {
            saveMe3DForSampleSizeFunction()
            cat(" End of test saveMe3DForSampleSize", "\n")
            cat("=========================================")
          })
