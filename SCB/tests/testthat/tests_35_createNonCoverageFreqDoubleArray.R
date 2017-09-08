createNonCoverageFreqDoubleArrayFunction <- function () {
  cat("\n Testing \'createNonCoverageFreqDoubleArray\' \n")
  myAlphaCount = 3
  myTParCount  <- 2
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 3
  myReplicationCount <- 6

  mySampleSize <- 100

  myLag <- 1
  myLagCount <- 4
  myKernel <- normalDifferenceKernel
  myAlphaArray <- seq(from = 0.05,
                    to   = 1 - 1 / myAlphaCount,
                    by   = 1 / myAlphaCount)

  myBandwidth <- 0.5
  Start=Sys.time()
  doubleAlphaArray = createDoubleAlphaArray(
    superReplicationCount = mySuperReplicationCount,
    replicationCount = myReplicationCount,
    sampleSize = mySampleSize,alphaArray =myAlphaArray,
    lag = myLag,
    lagCount = myLagCount,
    tParArray = myTParArray,
    kernel = myKernel,
    bandwidth = myBandwidth)
  End=Sys.time()
  duration=End-Start
  cat("DoubleAlphaHatArray= ",doubleAlphaArray)
  cat("\n size of double array= ",length(doubleAlphaArray))
  cat("\n Duration= ",duration)
  # expect_that(mockBand, is_a("matrix"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols

}

test_that("Testing \' createNonCoverageFreqDoubleArray\'", {
  createNonCoverageFreqDoubleArrayFunction()
})
