saveAlphaHatOfSampleSizeFunction <- function()
{
  cat ("\n Testing \'tests_78_saveAlphaHatOfSampleSize\'\n")
  sampleSize <- seq(10,110,by=100)

  nonCoverageProbability <- 0.1

  tParCount <- 10


  lag <- 1



  replicationCount <- 42
  mySuperReplicationCount <- 1

  fileName = "tests_78_saveAlphaHatOfSampleSize"

  testUtilSaveAlphaHatOfSampleSize(sampleSize = sampleSize,
                           nonCoverageProbability = nonCoverageProbability,
                           tParCount = tParCount,
                           lag = lag,
                           replicationCount = replicationCount,
                           superReplicationCount = mySuperReplicationCount,
                           fileName = fileName)
}
test_that("testing saveAlphaHatOfSampleSize",
          {
            saveAlphaHatOfSampleSizeFunction()
            cat(" End of test saveAlphaHatOfSampleSize", "\n")
            cat("=========================================")
          })
