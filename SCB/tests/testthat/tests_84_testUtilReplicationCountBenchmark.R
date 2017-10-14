testUtilReplicationCountBenchmarkFunction <- function()
{
  cat ("\n Testing \'tests_84_testUtilReplicationCountBenchmark\'\n")
  myTParCount  <-10
  mySuperReplicationCount <- 4
  myNonCoverageProbability <- 0.05
  mySampleSize <- computeMinSampleSize(myNonCoverageProbability)
  myLag <- 1

  myReplicationCount <- 4:5
  errorIfNotInputCompatible(myNonCoverageProbability,myLag,mySampleSize)
  testUtilReplicationCountBenchmark(sampleSize = mySampleSize,
                                    superReplicationCount = mySuperReplicationCount,
                                    tParCount = myTParCount,
                                    nonCoverageProbability = myNonCoverageProbability,
                                    replicationCountArray = myReplicationCount,
                                    lag = myLag)


}
test_that("testing testUtilReplicationCountBenchmarkFunction",{


  testUtilReplicationCountBenchmarkFunction()
  cat("\n End of test testUtilReplicationCountBenchmarkFunction", "\n")
  cat("=========================================")
})
