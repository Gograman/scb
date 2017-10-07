saveMeForBandwithFunction <- function()
{
  cat ("\n Testing \'tests_82_saveMeForBandwith\'\n")
  sampleSize <- 50
  bandwith <- seq(0.1,0.9,0.2)
  tParCount <- 10

  nonCoverageProbability <- 0.2
  lag <- 1

  testUtilSaveMeForBandwith(sampleSize = sampleSize,
                            tParCount = tParCount,
                            bandwith = bandwith,
                            lag = lag,
                            nonCoverageProbability = nonCoverageProbability)

}
test_that("testing saveMeForBandwithFunction",{


  saveMeForBandwithFunction()
  cat(" End of test saveMeForBandwithFunction", "\n")
  cat("=========================================")
})

