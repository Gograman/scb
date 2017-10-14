testUtilSupereplicationCountBenchmarkFunction <- function()
{
  cat ("\n Testing \'tests_85_testUtilSupeReplicationCountBenchmark\'\n")
  myTParCount  <-10
  myReplicationCount <- 4
  myNonCoverageProbability <- 0.05
  mySampleSize <- computeMinSampleSize(myNonCoverageProbability)
  myLag <- 1

  mySuperReplicationCount <- 4:5
  errorIfNotInputCompatible(myNonCoverageProbability,myLag,mySampleSize)
  testUtilSupereplicationCountBenchmark(sampleSize = mySampleSize,
                                    superReplicationCountArray = mySuperReplicationCount,
                                    tParCount = myTParCount,
                                    nonCoverageProbability = myNonCoverageProbability,
                                    replicationCount = myReplicationCount,
                                    lag = myLag)
}

test_that("testing testUtilSupereplicationCountBenchmarkFunction",{


  testUtilSupereplicationCountBenchmarkFunction()
  cat("\n End of test testUtilSupereplicationCountBenchmarkFunction", "\n")
  cat("=========================================")
})
