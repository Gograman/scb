if(!require("lattice")) {
  install.packages("lattice")
  library(lattice)
}


saveMe3DForBandwidthFunction <- function()
{
  cat ("\n Testing \'tests_76_saveMe3DForBandwidth\'\n")
  sampleSize <- 200


  tParCount <- 10


  alphas <- seq(0.1,0.9,by = 0.1)

  lag <- 1


  bandwidth <- seq(0.1,0.9,by = 0.1)

  testUtilSaveMesaveMe3DForBandwidth(sampleSize = sampleSize,
                                     tParCount = tParCount,
                                     alphas = alphas,
                                     lag = lag,
                                     bandwidth = bandwidth)


}
test_that("testing saveMe3DForBandwidth",
          {
            saveMe3DForBandwidthFunction()
            cat(" End of test saveMe3DForBandwidth", "\n")
            cat("=========================================")
          })
