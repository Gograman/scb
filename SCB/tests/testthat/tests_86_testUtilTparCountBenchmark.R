testUtilTParCountBenchmarkFunction <- function()
{
  cat ("\n Testing \'tests_86_testUtilTparCountBenchmark\'\n")
  myTParCount  <-2:3
  myReplicationCount <- 4
  myNonCoverageProbability <- 0.05
  mySampleSize <- computeMinSampleSize(myNonCoverageProbability)
  myLag <- 1

  mySuperReplicationCount <- 4
  errorIfNotInputCompatible(myNonCoverageProbability,myLag,mySampleSize)
  testUtilTParCountBenchmark(sampleSize = mySampleSize,
                             superReplicationCount = mySuperReplicationCount,
                            tParCountArray =  myTParCount,
                                      nonCoverageProbability = myNonCoverageProbability,
                                        replicationCount = myReplicationCount,
                                        lag = myLag)
}
test_that("testing testUtilTParCountBenchmarkFunction",{


  testUtilTParCountBenchmarkFunction()
  cat("\n End of test testUtilTParCountBenchmarkFunction", "\n")
  cat("=========================================")
})
