testUtilSampleSizeBenchmarkFunction <- function()
{
  cat ("\n Testing \'tests_83_testUtilSampleSizeBenchmark\'\n")

  myTParCount  <-2
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 4
  myReplicationCount <- 4

  myLag <- 1



  myNonCoverageProbability <- 0.05

  minSampleSize <- computeMinSampleSize(myNonCoverageProbability)

  sampleSizeArray <- c(minSampleSize,20)


  testUtilSampleSizeBenchmark(sampleSizeArray = sampleSizeArray,
                              tParCount = myTParCount,
                              superReplicationCount = mySuperReplicationCount,
                              replicationCount = myReplicationCount,
                              lag = myLag,
                              nonCoverageProbability = myNonCoverageProbability)
}

test_that("testing testUtilSampleSizeBenchmarkFunction",{


  testUtilSampleSizeBenchmarkFunction()
  cat(" End of test testUtilSampleSizeBenchmarkFunction", "\n")
  cat("=========================================")
})
